import 'package:climbing_diary/core/extentions/date_time_extention.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:flutter/material.dart';

class CardioTreaningWidget extends StatelessWidget {
  final CardioTreaning treaning;
  const CardioTreaningWidget({required this.treaning, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        leading: Icon(treaning.exercise.icon),
        title: Row(
          children: [
            Text(
                '${treaning.length.toString()} ${treaning.exercise.lenghtUnit}.'),
            const SizedBox(width: 12),
            Text('${treaning.duration.toString()} мин.'),
            const Spacer(),
            Text(treaning.date.dayString()),
          ],
        ),
      ),
    );
  }
}