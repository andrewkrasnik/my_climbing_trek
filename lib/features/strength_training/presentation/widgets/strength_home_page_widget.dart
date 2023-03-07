import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:flutter/material.dart';

class StrengthHomePageWidget extends StatelessWidget {
  const StrengthHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('Силовая тренировка'),
        ),
        StrengthTreaningWidget(treaning: StrengthTreaning(date: DateTime.now()))
      ],
    );
  }
}
