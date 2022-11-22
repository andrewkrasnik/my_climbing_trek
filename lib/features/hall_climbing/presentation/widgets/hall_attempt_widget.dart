import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_attempt_dialog.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_route_go_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_sector_number_widget.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HallSectorNumberWidget(
          route: attempt.route,
          child: HallRouteCategoryWidget.fromAttempt(
            attempt: attempt,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attempt.style.name),
            const Text('первая попытка'),
          ],
        ),
        isCurrent
            ? Row(
                children: [
                  ElevatedButton(
                    child: const Text('Завершить'),
                    onPressed: () {
                      // BlocProvider.of<CurrentHallTreaningCubit>(context)
                      //     .finishCurrentAttempt();
                      showDialog(
                        context: context,
                        builder: (context) =>
                            HallAttemptDialog(attempt: attempt),
                      );
                    },
                  ),
                ],
              )
            : BlocBuilder<CurrentHallTreaningCubit, CurrentHallTreaningState>(
                builder: (context, state) {
                  return state.currentAttempt == null && attempt.route != null
                      ? HallRouteGoButton(
                          route: attempt.route!,
                          climbingHall: state.current!.climbingHall,
                        )
                      : const SizedBox();
                },
              ),
      ],
    );
  }
}
