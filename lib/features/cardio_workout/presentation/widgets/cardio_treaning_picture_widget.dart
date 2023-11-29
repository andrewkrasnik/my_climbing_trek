import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';

class CardioTreaningPictureWidget extends StatelessWidget {
  final CardioTreaning treaning;

  const CardioTreaningPictureWidget({
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Расстояние: ${treaning.length.toStringAsFixed(0)} ${treaning.exercise.lengthUnit}.',
            style: textStyle,
          ),
          Text(
            'Продолжительность: ${treaning.duration.toString()} мин.',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
