import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:flutter/material.dart';

class HallRouteCategoryWidget extends StatelessWidget {
  final ClimbingCategory category;
  final Color? color;
  final bool planed;

  const HallRouteCategoryWidget({
    Key? key,
    required this.category,
    this.color,
    this.planed = false,
  }) : super(key: key);

  HallRouteCategoryWidget.fromAttempt({
    required ClimbingHallAttempt attempt,
    super.key,
  })  : category = attempt.routeCategory,
        color = attempt.routeColor,
        planed = attempt.planed;

  @override
  Widget build(BuildContext context) {
    final double opacity = planed ? 0.5 : 1;
    if (color == null) {
      return CircleAvatar(
        backgroundColor: Colors.red.withOpacity(opacity),
        radius: 24,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: Text(
            category.name,
            style: TextStyle(
                color: Colors.black.withOpacity(opacity),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
      );
    }
    {
      return CircleAvatar(
        backgroundColor: color?.withOpacity(opacity),
        radius: 24,
        child: Text(
          category.name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      );
    }
  }
}
