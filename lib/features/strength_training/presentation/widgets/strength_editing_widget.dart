import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/pages/strength_exercises_page.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/service_locator.dart';

class StrengthEditingWidget extends HookWidget {
  final StrengthTreaning treaning;

  const StrengthEditingWidget({required this.treaning, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(treaning.date);

    return BlocProvider(
      create: (context) => getIt<StrengthTrainingCubit>(),
      child: BlocBuilder<StrengthTrainingCubit, StrengthTrainingState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    const Spacer(flex: 2),
                    DatePickerWidget(date: date),
                    const Spacer(flex: 1),
                    IconButton(
                      onPressed: () async {
                        final cubit =
                            BlocProvider.of<StrengthTrainingCubit>(context);

                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const StrengthExercisesPage(),
                        ));

                        cubit.updateExercises(treaning: treaning);
                      },
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),
                ...treaning.attempts.map(
                  (item) => StrengthTreaningExerciseLineWidget(
                    item: item,
                    treaning: treaning,
                    editing: true,
                  ),
                ),
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () async {
                    final cubit =
                        BlocProvider.of<StrengthTrainingCubit>(context);

                    final finishPermission = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            const Text('Подтверждение завершения тренировки'),
                        content: const Text('Завершить тренировку?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Отменить'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Продолжить'),
                          ),
                        ],
                      ),
                    );

                    if (finishPermission == true) {
                      cubit.changeDate(
                        treaning: treaning,
                        date: date.value,
                      );

                      Navigator.of(context).pop(true);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
