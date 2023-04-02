import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/bool_value_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_sector_number_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/int_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HallAttemptDialog extends HookWidget {
  final ClimbingHallAttempt attempt;
  const HallAttemptDialog({
    Key? key,
    required this.attempt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool editing = attempt.started;
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
            Text(attempt.style.toString()),
            HallSectorNumberWidget(
              route: attempt.route,
              child: HallRouteCategoryWidget.fromAttempt(attempt: attempt),
            ),
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
              if (attempt.finished && attempt.ascentType != null)
                Text(attempt.ascentType!.toString()),
            ]
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
              BlocProvider.of<CurrentHallTreaningCubit>(context)
                  .startAttempt(attempt: attempt);
              Navigator.of(context).pop();
            },
            child: const Text('Старт'),
          ),
        if (attempt.started)
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CurrentHallTreaningCubit>(context)
                  .finishCurrentAttempt(
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
              BlocProvider.of<CurrentHallTreaningCubit>(context)
                  .deleteAttempt(attempt: attempt);
              Navigator.of(context).pop();
            },
            child: const Text('Удалить'),
          ),
      ],
    );
  }
}
