import 'package:climbing_diary/core/extentions/date_time_extention.dart';
import 'package:climbing_diary/core/widgets/int_counter_widget.dart';

import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:climbing_diary/features/strength_training/presentation/pages/strength_exercises_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StrengthTreaningWidget extends StatelessWidget {
  final StrengthTreaning treaning;
  final bool editing;
  const StrengthTreaningWidget(
      {required this.treaning, this.editing = false, Key? key})
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
                        if (editing)
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final cubit =
                                      BlocProvider.of<StrengthTrainingCubit>(
                                          context);

                                  final finishPermission =
                                      await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Подтверждение завершения тренировки'),
                                      content:
                                          const Text('Завершить тренировку?'),
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
                                    cubit.finishTreaning(treaning: treaning);
                                  }
                                },
                                icon: const Icon(Icons.stop),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final cubit =
                                      BlocProvider.of<StrengthTrainingCubit>(
                                          context);

                                  await Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        const StrengthExercisesPage(),
                                  ));

                                  cubit.updateExercises(treaning: treaning);
                                },
                                icon: const Icon(Icons.settings),
                              ),
                            ],
                          )
                      ],
                    ),
                    ...treaning.excercises
                        .map((item) => StrengthTreaningExerciseLineWidget(
                              item: item,
                              treaning: treaning,
                              editing: editing,
                            ))
                  ],
                ),
              ),
            )));
  }
}

class StrengthTreaningExerciseLineWidget extends HookWidget {
  final StrengthTreaningExerciseLine item;
  final StrengthTreaning treaning;
  final bool editing;

  const StrengthTreaningExerciseLineWidget(
      {required this.item,
      required this.treaning,
      this.editing = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countController = useState<int>(item.exercise.repetitions);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text('${item.exercise.name}:')),
          ...item.repetitions.map(
            (count) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: SizedBox(
                width: 24,
                child: Text(
                  count.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (editing) ...[
            IntCounterWidget(valueState: countController),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                BlocProvider.of<StrengthTrainingCubit>(context).addRepetition(
                  treaning: treaning,
                  exercise: item.exercise,
                  count: countController.value,
                );
              },
              icon: const Icon(
                Icons.save,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
