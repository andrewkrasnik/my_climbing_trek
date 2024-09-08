import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempts_with_style.dart';

class RockTreaningPictureWidget extends StatelessWidget {
  final RockTreaning treaning;

  const RockTreaningPictureWidget({
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

    final cubit = BlocProvider.of<RockTreaningCubit>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (treaning.hasTrad)
            RockAttemptsWithStyle(
              attempts: treaning.tradAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.trad,
              cubit: cubit,
              child: Text(
                'Трэд:',
                style: textStyle,
              ),
            ),
          if (treaning.hasLead)
            RockAttemptsWithStyle(
              attempts: treaning.leadAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.lead,
              cubit: cubit,
              child: Text(
                'Нижняя:',
                style: textStyle,
              ),
            ),
          if (treaning.hasBouldering)
            RockAttemptsWithStyle(
              attempts: treaning.boulderingAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.bouldering,
              cubit: cubit,
              child: Text(
                'Болдер:',
                style: textStyle,
              ),
            ),
          if (treaning.hasTopRope)
            RockAttemptsWithStyle(
              attempts: treaning.topRopeAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.topRope,
              cubit: cubit,
              child: Text(
                'Верхняя:',
                style: textStyle,
              ),
            ),
        ],
      ),
    );
  }
}
