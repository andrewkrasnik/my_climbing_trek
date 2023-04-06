import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/attempt_budget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempt_dialog.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/select_rock_route_widget.dart';

class RockAttemptsWithStyle extends StatelessWidget {
  final Widget child;
  final List<RockTreaningAttempt> attempts;
  final RockTreaning treaning;
  final bool isCurrent;
  final ClimbingStyle climbingStyle;
  const RockAttemptsWithStyle({
    required this.child,
    required this.attempts,
    Key? key,
    required this.treaning,
    required this.isCurrent,
    required this.climbingStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RockTreaningCubit, RockTreaningState>(
      builder: (context, state) {
        final bool showAddButton = isCurrent && state.currentAttempt == null;
        final cubit = BlocProvider.of<RockTreaningCubit>(context);
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          children: [
            SizedBox(width: 80, child: child),
            ...attempts
                .map((attempt) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AttemptClickWidget(
                        attempt: attempt,
                      ),
                    ))
                .toList(),
            if (showAddButton)
              IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) {
                      return SelectRockRouteWidget(
                        treaning: treaning,
                        style: climbingStyle,
                        cubit: cubit,
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add_box,
                  color: Theme.of(context).primaryColor,
                ),
              ),
          ],
        );
      },
    );
  }
}

class AttemptClickWidget extends StatelessWidget {
  final RockTreaningAttempt attempt;
  const AttemptClickWidget({
    required this.attempt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget topRight;

    if (attempt.fail == true) {
      topRight = const AttemptBudget(
          color: Colors.red,
          child: Icon(
            Icons.close,
            size: 12,
            color: Colors.white,
          ));
    } else {
      topRight = const SizedBox();
    }

    const badgetTextStyle =
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

    final Widget bottomRight = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (attempt.fallCount > 0)
          AttemptBudget(
            color: Colors.red,
            child: Text(
              attempt.fallCount.toString(),
              textAlign: TextAlign.center,
              style: badgetTextStyle,
            ),
          ),
        if (attempt.suspensionCount > 0)
          AttemptBudget(
            color: Colors.orange,
            child: Text(
              attempt.suspensionCount.toString(),
              textAlign: TextAlign.center,
              style: badgetTextStyle,
            ),
          ),
      ],
    );

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => RockAttemptDialog(
          attempt: attempt,
          cubit: BlocProvider.of<RockTreaningCubit>(context),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          RockCategoryWidget(
            category: attempt.category,
          ),
          Positioned(right: 0, top: 0, child: topRight),
          Positioned(
            right: 0,
            bottom: 0,
            child: bottomRight,
          )
        ],
      ),
    );
  }
}
