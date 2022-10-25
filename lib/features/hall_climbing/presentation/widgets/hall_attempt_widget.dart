import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallAttemptWidget extends StatelessWidget {
  final bool isCurrent;
  final ClimbingHallAttempt attempt;
  const HallAttemptWidget({
    Key? key,
    required this.attempt,
    this.isCurrent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: HallRouteCategoryWidget.fromAttempt(
        attempt: attempt,
      ),
      title: Text(attempt.style.name),
      subtitle: const Text('первая попытка'),
      trailing: isCurrent
          ? ElevatedButton(
              child: const Text('Завершить'),
              onPressed: () {
                BlocProvider.of<CurrentHallTreaningCubit>(context)
                    .finishCurrentAttempt();
              },
            )
          : ElevatedButton(
              child: const Text('Повторить'),
              onPressed: () {
                BlocProvider.of<CurrentHallTreaningCubit>(context)
                    .repeatAttempt(attempt: attempt);
              },
            ),
    );
  }
}
