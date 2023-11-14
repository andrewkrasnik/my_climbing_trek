import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempts_with_style.dart';

class IceTreaningPictureWidget extends StatelessWidget {
  final IceTreaning treaning;

  const IceTreaningPictureWidget({
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
          if (treaning.hasLead)
            IceAttemptsWithStyle(
              attempts: treaning.leadAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.lead,
              child: Text(
                'Нижняя:',
                style: textStyle,
              ),
            ),
          if (treaning.hasTopRope)
            IceAttemptsWithStyle(
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
