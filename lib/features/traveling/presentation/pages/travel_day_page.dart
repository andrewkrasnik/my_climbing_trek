import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/feeding_lines_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/stay_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/transport_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_lines_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TravelDayPage extends StatelessWidget {
  final TravelDay day;

  const TravelDayPage({required this.day, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TravelDayCubit>()..loadData(day: day),
      child: BlocConsumer<TravelDayCubit, TravelDayState>(
        listenWhen: (previous, current) => current.errorMessage.isNotEmpty,
        buildWhen: (previous, current) => current.errorMessage.isEmpty,
        listener: (context, state) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<TravelDayCubit>(context);
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('День ${day.number}: '),
                    const SizedBox(width: 4),
                    Text(day.dateString),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  if (await cubit.saveTravelDay(day: day)) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Icon(Icons.save),
              ),
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TextFormField(
                          minLines: 3,
                          maxLines: 5,
                          initialValue: state.description,
                          decoration: const InputDecoration(
                            labelText: 'Описание',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            cubit.editTravelDay(description: value);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.6,
                                    child:
                                        TransportParametersWidget(cubit: cubit),
                                  );
                                },
                                child: const Text('Транспорт')),
                            OutlinedButton(
                                onPressed: () {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.6,
                                    child: StayParametersWidget(cubit: cubit),
                                  );
                                },
                                child: const Text('Остановка')),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TravelDayLinesWidget(
                          stayLines: state.stayLines,
                          transportLines: state.transportLines,
                          editing: true,
                        ),
                        FeedingLinesWidget(
                          lines: state.feedingsLines,
                          editing: true,
                          onTap: (line, type) {
                            cubit.editFeedingLine(line: line, type: type);
                          },
                        ),
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
