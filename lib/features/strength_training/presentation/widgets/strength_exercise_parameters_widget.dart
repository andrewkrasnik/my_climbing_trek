import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StrengthExerciseParametersWidget extends HookWidget {
  final StrengthExercisesCubit cubit;
  final StrengthExercise? exercise;

  const StrengthExerciseParametersWidget(
      {this.exercise, required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: exercise?.name);

    final repetitionsController =
        useTextEditingController(text: exercise?.repetitions.toString());

    final repetitionsFocusNode = useFocusNode();

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
              onEditingComplete: () {
                repetitionsFocusNode.requestFocus();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: repetitionsController,
              keyboardType: TextInputType.number,
              focusNode: repetitionsFocusNode,
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
