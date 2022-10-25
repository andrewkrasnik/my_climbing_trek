import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:flutter/material.dart';

class HallRouteCategoryWidget extends StatelessWidget {
  final String category;
  final Color color;
  const HallRouteCategoryWidget({
    Key? key,
    required this.category,
    required this.color,
  }) : super(key: key);

  HallRouteCategoryWidget.fromAttempt({
    required ClimbingHallAttempt attempt,
    super.key,
  })  : category = attempt.routeCategory,
        color = Color(attempt.routeColor);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        category,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
