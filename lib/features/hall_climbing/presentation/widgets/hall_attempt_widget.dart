import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:flutter/material.dart';

class HallAttemptWidget extends StatelessWidget {
  final ClimbingHallAttempt attempt;
  const HallAttemptWidget({
    Key? key,
    required this.attempt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36,
      color: Colors.red,
    );
  }
}
