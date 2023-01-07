import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:flutter/material.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';

class HallTreaningPictureWidget extends StatelessWidget {
  final ClimbingHallTreaning treaning;
  final String imageSource;
  const HallTreaningPictureWidget({
    Key? key,
    required this.treaning,
    required this.imageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          opacity: 0.6,
          image: NetworkImage(
            imageSource,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              treaning.climbingHall.name,
              style: textStyle,
            ),
            Text(
              treaning.dateString,
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        if (treaning.hasLead)
          AttemptsWithStyle(
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
          AttemptsWithStyle(
            attempts: treaning.topRopeAttempts,
            treaning: treaning,
            isCurrent: false,
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
            climbingStyle: ClimbingStyle.autoBelay,
            child: Text(
              'Auto belay:',
              style: textStyle,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
      ]),
    );
  }
}
