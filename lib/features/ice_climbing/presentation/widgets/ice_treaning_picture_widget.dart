import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempts_with_style.dart';

class IceTreaningPictureWidget extends StatelessWidget {
  final IceTreaning treaning;
  final String imageSource;
  const IceTreaningPictureWidget({
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
              treaning.district.name,
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
        const SizedBox(
          height: 12,
        ),
      ]),
    );
  }
}
