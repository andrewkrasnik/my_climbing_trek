import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:flutter/material.dart';

class HallTreaningWidget extends StatelessWidget {
  final ClimbingHallTreaning treaning;
  const HallTreaningWidget({
    Key? key,
    required this.treaning,
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
