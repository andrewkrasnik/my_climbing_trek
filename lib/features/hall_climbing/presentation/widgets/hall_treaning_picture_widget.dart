import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/service_locator.dart';

class HallTreaningPictureWidget extends StatelessWidget {
  final ClimbingHallTreaning treaning;

  const HallTreaningPictureWidget({
    super.key,
    required this.treaning,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );

    final cubit = getIt<CurrentHallTreaningCubit>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (treaning.hasLead)
            AttemptsWithStyle(
              attempts: treaning.leadAttempts,
              treaning: treaning,
              isCurrent: false,
              cubit: cubit,
              climbingStyle: ClimbingStyle.lead,
              child: Text(
                'Нижняя:',
                style: textStyle,
              ),
            ),
          if (treaning.hasTopRope)
            AttemptsWithStyle(
              attempts: treaning.topRopeAttempts,
              treaning: treaning,
              isCurrent: false,
              cubit: cubit,
              climbingStyle: ClimbingStyle.topRope,
              child: Text(
                'Верхняя:',
                style: textStyle,
              ),
            ),
          if (treaning.hasBouldering)
            AttemptsWithStyle(
              attempts: treaning.boulderingAttempts,
              treaning: treaning,
              isCurrent: false,
              cubit: cubit,
              climbingStyle: ClimbingStyle.bouldering,
              child: Text(
                'Болдер:',
                style: textStyle,
              ),
            ),
          if (treaning.hasAutoBelay)
            AttemptsWithStyle(
              attempts: treaning.autoBelayAttempts,
              treaning: treaning,
              isCurrent: false,
              cubit: cubit,
              climbingStyle: ClimbingStyle.autoBelay,
              child: Text(
                'Auto belay:',
                style: textStyle,
              ),
            ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
