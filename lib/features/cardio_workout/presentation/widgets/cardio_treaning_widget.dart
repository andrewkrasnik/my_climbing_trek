import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
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
        leading: Icon(
          treaning.exercise.icon,
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Row(
          children: [
            Text(
                '${treaning.length.toString()} ${treaning.exercise.lengthUnit}.'),
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
