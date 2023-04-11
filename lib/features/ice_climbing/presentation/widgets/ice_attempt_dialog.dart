import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/bool_value_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/int_counter_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';

class IceAttemptDialog extends HookWidget {
  final IceTreaningAttempt attempt;
  final CurrentIceTreaningCubit cubit;

  final bool editing;
  const IceAttemptDialog({
    required this.attempt,
    required this.cubit,
    this.editing = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toolsCountState = useState<int>(attempt.toolsCount);
    final suspensionCountState = useState<int>(attempt.suspensionCount);
    final fallCountState = useState<int>(attempt.fallCount);
    final downClimbingState = useState<bool>(attempt.downClimbing);
    final failState = useState<bool>(attempt.fail);
    final iceScrewsCountState = useState<int>(attempt.iceScrewsCount);
    final installedIceScrewsState = useState<bool>(attempt.installedIceScrews);
    final lengthState = useState<int>(attempt.wayLength);
    return AlertDialog(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IceCategoryWidget(category: attempt.category),
              Text(attempt.style.toString()),
              Text('Сектор: ${attempt.sector.name}'),
              Text('Пройдено ${lengthState.value} м.'),
              if (editing)
                Row(
                  children: [
                    Slider(
                      value: lengthState.value.toDouble(),
                      min: 0,
                      divisions: attempt.sector.length,
                      max: attempt.sector.length.toDouble(),
                      onChanged: editing
                          ? (value) {
                              lengthState.value = value.toInt();
                            }
                          : null,
                    ),
                    Text('${attempt.sector.length} м.'),
                  ],
                ),
              if (editing)
                Row(
                  children: [
                    const Text('Инструменты:'),
                    Column(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: toolsCountState.value,
                            onChanged: editing
                                ? (value) {
                                    toolsCountState.value =
                                        (value as int?) ?? 2;
                                  }
                                : null),
                        const Text('2'),
                      ],
                    ),
                    Column(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: toolsCountState.value,
                            onChanged: editing
                                ? (value) {
                                    toolsCountState.value =
                                        (value as int?) ?? 2;
                                  }
                                : null),
                        const Text('1'),
                      ],
                    ),
                    Column(
                      children: [
                        Radio(
                            value: 0,
                            groupValue: toolsCountState.value,
                            onChanged: editing
                                ? (value) {
                                    toolsCountState.value =
                                        (value as int?) ?? 2;
                                  }
                                : null),
                        const Text('0'),
                      ],
                    ),
                  ],
                ),
              if (!editing) Text('Инструменты: ${attempt.toolsCount}'),
              if (attempt.style == ClimbingStyle.lead) ...[
                IntCounterWidget(
                  title: 'Использовано буров:',
                  valueState: iceScrewsCountState,
                  editing: editing,
                ),
                BoolValueWidget(
                    title: 'Буры предустановлены',
                    valueState: installedIceScrewsState,
                    editing: editing),
              ],
              BoolValueWidget(
                  title: 'Недолез', valueState: failState, editing: editing),
              IntCounterWidget(
                title: 'Зависаний:',
                valueState: suspensionCountState,
                editing: editing,
              ),
              IntCounterWidget(
                title: 'Срывов:',
                valueState: fallCountState,
                editing: editing,
              ),
              BoolValueWidget(
                  title: 'Спуск лазаньем',
                  valueState: downClimbingState,
                  editing: editing),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Назад'),
        ),
        if (attempt.planed)
          ElevatedButton(
            onPressed: () {
              cubit.startAttempt(attempt: attempt);
              Navigator.of(context).pop();
            },
            child: const Text('Старт'),
          ),
        if (attempt.started)
          ElevatedButton(
            onPressed: () {
              cubit.finishCurrentAttempt(
                fail: failState.value,
                downClimbing: downClimbingState.value,
                fallCount: fallCountState.value,
                suspensionCount: suspensionCountState.value,
                toolsCount: toolsCountState.value,
                iceScrewsCount: iceScrewsCountState.value,
                installedIceScrews: installedIceScrewsState.value,
                length: lengthState.value,
              );
              Navigator.of(context).pop();
            },
            child: const Text('Завершить'),
          ),
        if (attempt.finished)
          ElevatedButton(
            onPressed: () {
              cubit.deleteAttempt(attempt: attempt);
              Navigator.of(context).pop();
            },
            child: const Text('Удалить'),
          ),
      ],
    );
  }
}
