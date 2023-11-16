import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/climbing_hall_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_attempt_dialog.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_picture_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/select_hall_route_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HallTreaningWidget extends StatelessWidget {
  final bool isCurrent;
  final ClimbingHallTreaning treaning;
  const HallTreaningWidget({
    super.key,
    required this.treaning,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ClimbingHallPage(
                                climbingHall: treaning.climbingHall,
                              ))),
                      child: Text(treaning.climbingHall.name)),
                  const Spacer(),
                  Text(DateFormat('dd.MM.yyyy').format(treaning.date)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TreaningPicturePage(
                                treaning: treaning,
                                child: HallTreaningPictureWidget(
                                  treaning: treaning,
                                ),
                              )));
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              if (treaning.climbingHall.hasBigWall &&
                  (isCurrent || treaning.hasLead))
                AttemptsWithStyle(
                  attempts: treaning.leadAttempts,
                  treaning: treaning,
                  isCurrent: isCurrent,
                  climbingStyle: ClimbingStyle.lead,
                  child: const Text('Нижняя:'),
                ),
              if (treaning.climbingHall.hasBigWall &&
                  (isCurrent || treaning.hasTopRope))
                AttemptsWithStyle(
                  attempts: treaning.topRopeAttempts,
                  treaning: treaning,
                  isCurrent: isCurrent,
                  climbingStyle: ClimbingStyle.topRope,
                  child: const Text('Верхняя:'),
                ),
              if (treaning.climbingHall.hasBouldering &&
                  (isCurrent || treaning.hasBouldering))
                AttemptsWithStyle(
                  attempts: treaning.boulderingAttempts,
                  treaning: treaning,
                  isCurrent: isCurrent,
                  climbingStyle: ClimbingStyle.bouldering,
                  child: const Text('Болдер:'),
                ),
              if (treaning.climbingHall.hasAutoBelay &&
                  (isCurrent || treaning.hasAutoBelay))
                AttemptsWithStyle(
                  attempts: treaning.autoBelayAttempts,
                  treaning: treaning,
                  isCurrent: isCurrent,
                  climbingStyle: ClimbingStyle.autoBelay,
                  child: const Text('Auto belay:'),
                ),
              BlocBuilder<CurrentHallTreaningCubit, CurrentHallTreaningState>(
                builder: (context, state) {
                  if (isCurrent) {
                    if (state.currentAttempt == null) {
                      return TextButton(
                        child: const Text('Завершить'),
                        onPressed: () {
                          BlocProvider.of<CurrentHallTreaningCubit>(context)
                              .finishCurrentTreaning();
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  } else {
                    // if (state.current == null) {
                    //   return Row(
                    //     children: [
                    //       const Expanded(child: SizedBox()),
                    //       TextButton(
                    //         child: const Text('Повторить'),
                    //         onPressed: () {
                    //           BlocProvider.of<CurrentHallTreaningCubit>(context)
                    //               .repeatTreaning(treaning: treaning);
                    //         },
                    //       ),
                    //     ],
                    //   );
                    // } else {
                    return const SizedBox();
                    // }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttemptsWithStyle extends StatelessWidget {
  final Widget child;
  final List<ClimbingHallAttempt> attempts;
  final ClimbingHallTreaning treaning;
  final bool isCurrent;
  final ClimbingStyle climbingStyle;
  const AttemptsWithStyle({
    required this.child,
    required this.attempts,
    super.key,
    required this.treaning,
    required this.isCurrent,
    required this.climbingStyle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentHallTreaningCubit, CurrentHallTreaningState>(
      builder: (context, state) {
        final bool showAddButton = isCurrent && state.currentAttempt == null;
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(width: 80, child: child),
            ...attempts
                .map((attempt) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AttemptClickWidget(
                        attempt: attempt,
                      ),
                    ))
                ,
            if (showAddButton)
              IconButton(
                onPressed: () {
                  showMyModalBottomSheet<void>(
                    context: context,
                    heightPersent: 0.7,
                    child: SelectHallRouteWidget(
                      treaning: treaning,
                      style: climbingStyle,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add_box,
                ),
              ),
          ],
        );
      },
    );
  }
}

class AttemptClickWidget extends StatelessWidget {
  final ClimbingHallAttempt attempt;
  const AttemptClickWidget({
    required this.attempt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => HallAttemptDialog(attempt: attempt),
      ),
      child: HallRouteCategoryWidget.fromAttempt(attempt: attempt),
    );
  }
}
