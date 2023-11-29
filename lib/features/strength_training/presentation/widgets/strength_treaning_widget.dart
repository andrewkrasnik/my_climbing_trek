import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/int_counter_widget.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_page.dart';

import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/pages/strength_exercises_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_treaning_picture_widget.dart';

class StrengthTreaningWidget extends StatelessWidget {
  final StrengthTreaning treaning;
  final bool editing;
  const StrengthTreaningWidget(
      {required this.treaning, this.editing = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Силовая тренировка'),
                        const Spacer(),
                        Text(treaning.date.dayString()),
                        if (editing)
                          Row(
                            children: [
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
                          ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TreaningPicturePage(
                                      treaning: treaning,
                                      child: StrengthTreaningPictureWidget(
                                        treaning: treaning,
                                      ),
                                    )));
                          },
                          icon: const Icon(
                            Icons.share,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    ...treaning.attempts.map(
                      (item) => StrengthTreaningExerciseLineWidget(
                        item: item,
                        treaning: treaning,
                        editing: editing,
                      ),
                    ),
                    if (editing)
                      TextButton(
                        child: const Text('Завершить'),
                        onPressed: () async {
                          final cubit =
                              BlocProvider.of<StrengthTrainingCubit>(context);

                          final finishPermission = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                  'Подтверждение завершения тренировки'),
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
                            cubit.finishTreaning(treaning: treaning);
                          }
                        },
                      ),
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
  final TextStyle? textStyle;

  const StrengthTreaningExerciseLineWidget({
    required this.item,
    required this.treaning,
    this.editing = false,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (editing || item.hasRepetitions) {
      final countController = useState<int>(item.exercise.repetitions);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (editing)
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(item.exercise.name)),
                  IntCounterWidget(valueState: countController),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<StrengthTrainingCubit>(context)
                          .addRepetition(
                        treaning: treaning,
                        exercise: item.exercise,
                        count: countController.value,
                      );
                    },
                    icon: const Icon(
                      Icons.save,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<StrengthTrainingCubit>(context)
                          .deleteRepetition(
                        treaning: treaning,
                        exercise: item.exercise,
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
            Wrap(
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: [
                if (!editing) ...[
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        item.exercise.name,
                        textAlign: TextAlign.start,
                        style: textStyle,
                      )),
                ],
                ...item.repetitions.map(
                  (count) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: SizedBox(
                      width: 24,
                      child: Text(
                        count.toString(),
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
