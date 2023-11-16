import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travels/travels_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TravelsPage extends StatelessWidget {
  const TravelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TravelsCubit>()..loadData(),
      child: BlocBuilder<TravelsCubit, TravelsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Путешествия'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showMyModalBottomSheet<void>(
                  context: context,
                  heightPersent: 0.8,
                  child: TravelParametersWidget(
                      cubit: BlocProvider.of<TravelsCubit>(context)),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (dataState) => ListView.separated(
                        itemCount: dataState.travels.length,
                        itemBuilder: (context, index) {
                          final travel = dataState.travels[index];
                          return TravelWidget(
                            travel: travel,
                            height: 240,
                            showStatus: true,
                            onTap: () async {
                              final cubit =
                                  BlocProvider.of<TravelsCubit>(context);

                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TravelPage(travel: travel)));

                              cubit.loadData();
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                      ),
                  orElse: () => const SizedBox()),
            ),
          );
        },
      ),
    );
  }
}
