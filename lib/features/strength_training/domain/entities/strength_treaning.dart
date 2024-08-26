import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';

class StrengthTreaning extends Treaning {
  final List<StrengthTreaningExerciseLine> _excercises;

  @override
  bool get started => start != null && finish == null;

  @override
  bool get hasEditing => true;

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

  @override
  String get title => 'Силовая тренировка ${date.dayString()}';

  @override
  String get image =>
      'https://firebasestorage.googleapis.com/v0/b/my-climbing-trek.appspot.com/o/images%2Ftreanings%2Fstrength_treanings.jpg?alt=media&token=08b26286-64f6-4b30-9ba8-8ad2f2e3d0b4';

  @override
  String get place => 'Силовая тренировка';
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
