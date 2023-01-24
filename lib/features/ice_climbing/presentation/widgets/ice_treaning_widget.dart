import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/select_ice_route_widget.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Image(
              width: MediaQuery.of(context).size.width / 4,
              image: NetworkImage(
                treaning.district.image,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
    return Container();

    // InkWell(
    //   onTap: () => showDialog(
    //     context: context,
    //     builder: (context) => HallAttemptDialog(attempt: attempt),
    //   ),
    //   child: HallSectorNumberWidget(
    //     route: attempt.route,
    //     child: HallRouteCategoryWidget.fromAttempt(attempt: attempt),
    //   ),
    // );
  }
}
