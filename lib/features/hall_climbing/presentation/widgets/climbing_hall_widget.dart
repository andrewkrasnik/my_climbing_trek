import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:flutter/material.dart';

class ClimbingHallWidget extends StatelessWidget {
  final ClimbingHall climbingHall;
  const ClimbingHallWidget({
    Key? key,
    required this.climbingHall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 120,
      color: Colors.red,
    );
  }
}
