import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempts_with_style.dart';

class RockTreaningPictureWidget extends StatelessWidget {
  final RockTreaning treaning;

  const RockTreaningPictureWidget({
    Key? key,
    required this.treaning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );
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
