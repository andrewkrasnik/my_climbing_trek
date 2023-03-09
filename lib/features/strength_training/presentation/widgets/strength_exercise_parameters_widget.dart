import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/presentation/cubit/strength_exercise/strength_exercises_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StrengthExerciseParametersWidget extends HookWidget {
  final StrengthExercisesCubit cubit;
  final StrengthExercise? exercise;

  const StrengthExerciseParametersWidget(
      {this.exercise, required this.cubit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: exercise?.name);
    final repetitionsController =
        useTextEditingController(text: exercise?.repetitions.toString());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  labelText: 'Наименование', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: repetitionsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Количество повторений',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  cubit.save(
                    id: exercise?.id,
                    name: nameController.text,
                    repetitions: int.parse(repetitionsController.text),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}
