import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';

class StrengthTreaning extends Treaning {
  final List<StrengthTreaningExerciseLine> excercises = [];

  DateTime? _finish;
  DateTime? _start;

  bool get started => _start != null && _finish == null;

  void start() {
    _start = DateTime.now();
  }

  StrengthTreaning({
    super.id,
    required super.date,
  });

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
  final List<int> repetitions = [];

  bool get hasRepetitions => repetitions.isNotEmpty;

  StrengthTreaningExerciseLine({
    required this.exercise,
  });
}
