import 'package:climbing_diary/core/extentions/date_time_extention.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/presentation/pages/strength_exercises_page.dart';
import 'package:flutter/material.dart';

class StrengthTreaningWidget extends StatelessWidget {
  final StrengthTreaning treaning;
  const StrengthTreaningWidget({required this.treaning, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(treaning.date.dayString()),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const StrengthExercisesPage(),
                              ));
                            },
                            icon: const Icon(Icons.settings))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
