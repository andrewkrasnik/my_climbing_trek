import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/attempt_budget.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempt_dialog.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/select_ice_route_widget.dart';

class IceAttemptsWithStyle extends StatelessWidget {
  final Widget child;
  final List<IceTreaningAttempt> attempts;
  final IceTreaning treaning;
  final bool isCurrent;
  final ClimbingStyle climbingStyle;
  const IceAttemptsWithStyle({
    required this.child,
    required this.attempts,
    super.key,
    required this.treaning,
    required this.isCurrent,
    required this.climbingStyle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentIceTreaningCubit, CurrentIceTreaningState>(
      builder: (context, state) {
        final bool showAddButton = isCurrent && state.currentAttempt == null;
        final cubit = BlocProvider.of<CurrentIceTreaningCubit>(context);
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          children: [
            SizedBox(width: 80, child: child),
            ...attempts.map((attempt) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AttemptClickWidget(
                    attempt: attempt,
                  ),
                )),
            if (showAddButton)
              IconButton(
                onPressed: () {
                  showMyModalBottomSheet<void>(
                    context: context,
                    heightPersent: 0.7,
                    child: SelectIceRouteWidget(
                      treaning: treaning,
                      style: climbingStyle,
                      cubit: cubit,
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
  final IceTreaningAttempt attempt;
  const AttemptClickWidget({
    required this.attempt,
    super.key,
  });

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
        builder: (context) => IceAttemptDialog(
          attempt: attempt,
          cubit: BlocProvider.of<CurrentIceTreaningCubit>(context),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          IceCategoryWidget(
            category: attempt.category,
            prefix: attempt.sector.icePrefix,
          ),
          Positioned(
            top: 6,
            child: Text(
              '${attempt.wayLength}м',
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          if (attempt.finished)
            Positioned(
                bottom: 4,
                child: Text(
                  attempt.toolsCountString,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
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
