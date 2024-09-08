import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/bool_value_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/int_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';

class RockAttemptDialog extends HookWidget {
  final RockTreaningAttempt attempt;
  final RockTreaningCubit cubit;

  final bool editing;
  const RockAttemptDialog({
    required this.attempt,
    required this.cubit,
    this.editing = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final suspensionCountState = useState<int>(attempt.suspensionCount);
    final fallCountState = useState<int>(attempt.fallCount);
    final downClimbingState = useState<bool>(attempt.downClimbing);
    final failState = useState<bool>(attempt.fail);

    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                RockCategoryWidget(category: attempt.category),
                if (attempt.route?.number != null)
                  Positioned(
                    bottom: 3,
                    child: Text(
                      attempt.route!.number.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
              ],
            ),
            Text(attempt.route?.name ?? 'Безымянная'),
            Text('Сектор: ${attempt.sector.name}'),
            Text(attempt.style.toString()),
            BoolValueWidget(
                title: 'Недолез', valueState: failState, editing: editing),
            if (attempt.style.type == ClimbingRouteType.rope) ...[
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
            if (attempt.finished && attempt.ascentType != null)
              Text(attempt.ascentType!.toString()),
          ],
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
        if (attempt.started || editing)
          ElevatedButton(
            onPressed: () {
              cubit.finishAttempt(
                attempt: attempt,
                fail: failState.value,
                downClimbing: downClimbingState.value,
                fallCount: fallCountState.value,
                suspensionCount: suspensionCountState.value,
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
