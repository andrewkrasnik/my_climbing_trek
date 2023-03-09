import 'package:climbing_diary/core/data/unique_id.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';

class StrengthTreaning {
  final UniqueId _id;
  final DateTime date;
  final List<StrengthTreaningExerciseLine> excercises = [];

  DateTime? _finish;
  DateTime? _start;

  bool get started => _start != null && _finish == null;

  bool get finished => _finish != null;

  void finish() {
    _finish = DateTime.now();
  }

  void start() {
    _start = DateTime.now();
  }

  String get id => _id.value;

  StrengthTreaning({
    String id = '',
    required this.date,
  }) : _id = UniqueId.fromUniqueString(id);

  void updateExercises({required List<StrengthExercise> selectedExercises}) {
    excercises.clear();

    excercises.addAll(selectedExercises
        .map((exercise) => StrengthTreaningExerciseLine(exercise: exercise))
        .toList());
  }
}

class StrengthTreaningExerciseLine {
  final StrengthExercise exercise;
  final List<int> repetitions = [];

  StrengthTreaningExerciseLine({
    required this.exercise,
  });
}
