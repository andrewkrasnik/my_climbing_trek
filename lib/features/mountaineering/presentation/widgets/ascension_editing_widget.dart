import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_route_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_events_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class AscensionEditingWidget extends HookWidget {
  final Ascension ascension;

  const AscensionEditingWidget({required this.ascension, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(ascension.date);

    final cubit = getIt<AscensionCubit>()..setAscension(ascension: ascension);

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<AscensionCubit, AscensionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DatePickerWidget(date: date),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MountainRoutePage(
                                  mountain: state.ascension!.mountain,
                                  route: state.ascension!.route,
                                ),
                              ),
                            ),
                        child: Text(state.ascension!.title)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                AscensionEventsWidget(
                  ascension: ascension,
                  editing: true,
                  cubit: cubit,
                ),
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () async {
                    final finishPermission = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            const Text('Подтверждение завершения тренировки'),
                        content: const Text('Завершить тренировку?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Отменить'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Продолжить'),
                          ),
                        ],
                      ),
                    );

                    if (finishPermission == true) {
                      cubit.changeDate(
                        date: date.value,
                      );

                      Navigator.of(context).pop(true);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
