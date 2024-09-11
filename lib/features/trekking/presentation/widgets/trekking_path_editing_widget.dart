import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking/trekking_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_page.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TrekkingPathEditingWidget extends HookWidget {
  final TrekkingPath path;

  const TrekkingPathEditingWidget({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(path.date);

    final cubit = getIt<TrekkingCubit>()..setPath(path: path);

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<TrekkingCubit, TrekkingState>(
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
                                builder: (context) => TrekPage(
                                  region: state.currentPath!.region,
                                  trek: state.currentPath!.trek!,
                                ),
                              ),
                            ),
                        child: Text(state.currentPath!.trek!.name)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                ...path.events.map(
                  (event) => Row(
                    children: [
                      Text(event.time.timeString()),
                      const SizedBox(width: 4),
                      if (event.point != null) ...[
                        Text(event.point!.name),
                        const SizedBox(width: 4),
                      ],
                      Text(event.type.name),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (state.currentPoint != null) ...[
                  const Text('Текущее местоположение:'),
                  Text(state.currentPoint!.name),
                  const SizedBox(height: 4),
                ],
                if (state.currentEvent?.isMooving == true &&
                    path.currentSection != null) ...[
                  const Text('Пункт назначения:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value:
                              state.currentPoint == path.currentSectionFinish,
                          onChanged: (value) {
                            if (state.currentPoint == null) {
                              cubit.setCurrentPoint(
                                  point: path.currentSectionFinish);
                            } else {
                              cubit.setCurrentPoint(point: null);
                            }
                          }),
                      const SizedBox(width: 4),
                      Text(path.currentSectionFinish.name),
                      const SizedBox(width: 4),
                      Text(
                          '${path.currentSection!.length} км ${path.currentSectionClimb}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                Wrap(
                  children: path.actions
                      .map((type) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: InkWell(
                                onTap: () {
                                  cubit.addEvent(
                                    path: path,
                                    type: type,
                                    point: state.currentPoint,
                                  );
                                },
                                child: Chip(
                                  label: Text(
                                    type.name,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                )),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 8,
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
