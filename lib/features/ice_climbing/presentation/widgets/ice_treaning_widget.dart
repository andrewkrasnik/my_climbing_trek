import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/attempt_budget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempt_dialog.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/select_ice_route_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class IceTreaningWidget extends StatelessWidget {
  final IceTreaning treaning;
  final bool isCurrent;

  const IceTreaningWidget(
      {required this.treaning, this.isCurrent = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            // Image(
            //   width: MediaQuery.of(context).size.width / 4,
            //   image: NetworkImage(
            //     treaning.district.image,
            //   ),
            // ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd.MM.yyyy').format(treaning.date)),
                    Text(treaning.district.name),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                if (isCurrent || treaning.hasLead)
                  _AttemptsWithStyle(
                    attempts: treaning.leadAttempts,
                    treaning: treaning,
                    isCurrent: isCurrent,
                    climbingStyle: ClimbingStyle.lead,
                    child: const Text('Нижняя:'),
                  ),
                if (isCurrent || treaning.hasTopRope)
                  _AttemptsWithStyle(
                    attempts: treaning.topRopeAttempts,
                    treaning: treaning,
                    isCurrent: isCurrent,
                    climbingStyle: ClimbingStyle.topRope,
                    child: const Text('Верхняя:'),
                  ),
                if (isCurrent &&
                    BlocProvider.of<CurrentIceTreaningCubit>(context)
                            .state
                            .currentAttempt ==
                        null)
                  TextButton(
                    child: const Text('Завершить'),
                    onPressed: () {
                      BlocProvider.of<CurrentIceTreaningCubit>(context)
                          .finishTreaning();
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AttemptsWithStyle extends StatelessWidget {
  final Widget child;
  final List<IceTreaningAttempt> attempts;
  final IceTreaning treaning;
  final bool isCurrent;
  final ClimbingStyle climbingStyle;
  const _AttemptsWithStyle({
    required this.child,
    required this.attempts,
    Key? key,
    required this.treaning,
    required this.isCurrent,
    required this.climbingStyle,
  }) : super(key: key);

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
                      return SelectIceRouteWidget(
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
  final IceTreaningAttempt attempt;
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
              '${attempt.length}м',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
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
