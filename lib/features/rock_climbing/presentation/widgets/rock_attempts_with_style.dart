import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempt_click_widget.dart';
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
    super.key,
    required this.treaning,
    required this.isCurrent,
    required this.climbingStyle,
  });

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
                      child: RockAttemptClickWidget(
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
                    child: SelectRockRouteWidget(
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
