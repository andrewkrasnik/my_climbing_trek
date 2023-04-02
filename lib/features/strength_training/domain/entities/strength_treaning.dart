import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';

class StrengthTreaning extends Treaning {
  final List<StrengthTreaningExerciseLine> excercises;

  bool get started => start != null && finish == null;

  StrengthTreaning({
    super.id,
    required super.date,
    super.finish,
    super.start,
    List<StrengthTreaningExerciseLine>? exercises,
  }) : excercises = exercises ?? [];

  void updateExercises({required List<StrengthExercise> selectedExercises}) {
    excercises.clear();

    excercises.addAll(selectedExercises
        .map((exercise) => StrengthTreaningExerciseLine(exercise: exercise))
        .toList());
  }

  int excercisesCount(bool editing) {
    if (editing) {
      return excercises.length;
    } else {
      return excercises.where((element) => element.hasRepetitions).length;
    }
  }
}

class StrengthTreaningExerciseLine {
  final StrengthExercise exercise;
  final List<int> repetitions;

  bool get hasRepetitions => repetitions.isNotEmpty;

  StrengthTreaningExerciseLine({
    required this.exercise,
    List<int>? repetitions,
  }) : repetitions = repetitions ?? [];
}
