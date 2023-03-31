import 'dart:convert';

import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';

class StrengthTreaningModel extends StrengthTreaning {
  StrengthTreaningModel({
    super.id,
    required super.date,
    super.finish,
    super.start,
    super.exercises,
  });

  factory StrengthTreaningModel.fromJson(
          Map<String, dynamic> json, Map<String, StrengthExercise> exercises) =>
      StrengthTreaningModel(
          id: json['id'] as String? ?? '',
          date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
          finish: json['finish'] == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(json['finish'] as int),
          start: json['start'] == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(json['start'] as int),
          exercises: json['exercises'] == null
              ? []
              : (json['exercises'] as List<Map<String, dynamic>>)
                  .map((line) => StrengthTreaningExerciseLineModel.fromJson(
                      line, exercises))
                  .toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'id': id,
        'start': start,
        'finish': finish,
        'exercises': excercises
            .map((e) => convertLine(line: e, treaningId: id).toJson())
            .toList()
      };
}

StrengthTreaningExerciseLineModel convertLine(
    {required StrengthTreaningExerciseLine line, required String treaningId}) {
  if (line is StrengthTreaningExerciseLineModel) {
    return line;
  } else {
    return StrengthTreaningExerciseLineModel(
      exercise: line.exercise,
      repetitions: line.repetitions,
      treaningId: treaningId,
    );
  }
}

class StrengthTreaningExerciseLineModel extends StrengthTreaningExerciseLine {
  final String treaningId;
  StrengthTreaningExerciseLineModel(
      {required this.treaningId, required super.exercise, super.repetitions});

  factory StrengthTreaningExerciseLineModel.fromJson(
      Map<String, dynamic> json, Map<String, StrengthExercise> exercises) {
    final List<dynamic> repetitions =
        const JsonDecoder().convert(json['repetitions']);

    return StrengthTreaningExerciseLineModel(
      exercise: exercises[(json['exercise'])]!,
      repetitions: repetitions.map((e) => int.parse(e.toString())).toList(),
      treaningId: json['treaningId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'exercise': exercise.id,
        'repetitions': const JsonEncoder().convert(repetitions),
        'treaningId': treaningId,
      };
}
