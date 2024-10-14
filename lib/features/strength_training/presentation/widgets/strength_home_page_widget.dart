import 'package:my_climbing_trek/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StrengthHomePageWidget extends StatelessWidget {
  const StrengthHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    BlocProvider.of<StrengthTrainingCubit>(context).loadData();

    return BlocBuilder<StrengthTrainingCubit, StrengthTrainingState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Силовые тренировки',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            if (state.currentTreaning == null)
              OutlinedButton(
                onPressed: () {
                  BlocProvider.of<StrengthTrainingCubit>(context).addTreaning();
                },
                child: const Text('Добавить тренировку'),
              ),
            if (state.currentTreaning != null) ...[
              const Text(
                'Текущая тренировка:',
                style: titleTextStyle,
              ),
              const SizedBox(height: 8),
              StrengthTreaningWidget(
                treaning: state.currentTreaning!,
                editing: state.currentTreaning!.started,
              ),
            ],
            if (state.previosTreaning != null) ...[
              const Text(
                'Предыдущая тренировка:',
                style: titleTextStyle,
              ),
              const SizedBox(height: 8),
              StrengthTreaningWidget(
                treaning: state.previosTreaning!,
              ),
            ],
          ],
        );
      },
    );
  }
}
