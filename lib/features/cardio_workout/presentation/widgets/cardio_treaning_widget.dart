import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_page.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_treaning_picture_widget.dart';

class CardioTreaningWidget extends StatelessWidget {
  final CardioTreaning treaning;
  const CardioTreaningWidget({required this.treaning, super.key});

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
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
                '${treaning.length.toString()} ${treaning.exercise.lengthUnit}.'),
            const SizedBox(width: 12),
            Text('${treaning.duration.toString()} мин.'),
            const Spacer(),
            Text(treaning.date.dayString()),
          ],
        ),
        trailing: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TreaningPicturePage(
                      treaning: treaning,
                      child: CardioTreaningPictureWidget(
                        treaning: treaning,
                      ),
                    )));
          },
          icon: Icon(
            Icons.share,
            size: 16,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
