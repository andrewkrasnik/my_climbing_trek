import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';

class StrengthTreaning extends Treaning {
  final List<StrengthTreaningExerciseLine> _excercises;

  bool get started => start != null && finish == null;

  List<StrengthTreaningExerciseLine> get attempts => _excercises;

  StrengthTreaning({
    super.id,
    required super.date,
    super.finish,
    super.start,
    List<StrengthTreaningExerciseLine>? attempts,
  }) : _excercises = attempts ?? [];

  void updateExercises({required List<StrengthExercise> selectedExercises}) {
    _excercises.clear();

    _excercises.addAll(selectedExercises
        .map((exercise) => StrengthTreaningExerciseLine(
              exercise: exercise,
              treaningId: id,
            ))
        .toList());
  }

  int excercisesCount(bool editing) {
    if (editing) {
      return _excercises.length;
    } else {
      return _excercises.where((element) => element.hasRepetitions).length;
    }
  }
}

class StrengthTreaningExerciseLine extends DataWithUUID {
  final String treaningId;
  final StrengthExercise exercise;
  final List<int> repetitions;

  bool get hasRepetitions => repetitions.isNotEmpty;

  StrengthTreaningExerciseLine({
    required this.treaningId,
    required this.exercise,
    List<int>? repetitions,
    super.id,
  }) : repetitions = repetitions ?? [];
}
