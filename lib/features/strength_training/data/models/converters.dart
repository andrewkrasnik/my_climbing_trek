import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/features/strength_training/data/models/strength_exercise_model.dart';
import 'package:my_climbing_trek/features/strength_training/data/models/strength_treaning_exercise_line_model.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';

class StrengthExerciseStringConverter
    implements JsonConverter<StrengthExercise, String> {
  const StrengthExerciseStringConverter();
  @override
  StrengthExercise fromJson(String json) {
    return StrengthExerciseModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(StrengthExercise object) {
    return jsonEncode((object as StrengthExerciseModel).toJson());
  }
}

class RepetitionsStringConverter implements JsonConverter<List<int>, String> {
  const RepetitionsStringConverter();
  @override
  List<int> fromJson(String json) {
    final List<dynamic> repetitions = const JsonDecoder().convert(json);
    return repetitions.map((e) => int.parse(e.toString())).toList();
  }

  @override
  String toJson(List<int> object) {
    return const JsonEncoder().convert(object);
  }
}

class StrengthTreaningExerciseLineConverter
    implements
        JsonConverter<StrengthTreaningExerciseLine, Map<String, dynamic>> {
  const StrengthTreaningExerciseLineConverter();
  @override
  StrengthTreaningExerciseLine fromJson(Map<String, dynamic> json) {
    return StrengthTreaningExerciseLineModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(StrengthTreaningExerciseLine object) {
    if (object is StrengthTreaningExerciseLineModel) {
      return object.toJson();
    } else {
      return StrengthTreaningExerciseLineModel(
              treaningId: object.treaningId,
              exercise: object.exercise,
              repetitions: object.repetitions)
          .toJson();
    }
  }
}

class StrengthTreaningExerciseLinesConverter
    implements
        JsonConverter<List<StrengthTreaningExerciseLine>,
            List<Map<String, dynamic>>> {
  const StrengthTreaningExerciseLinesConverter();
  @override
  List<StrengthTreaningExerciseLine> fromJson(List<Map<String, dynamic>> json) {
    return json
        .map((e) => StrengthTreaningExerciseLineModel.fromJson(e))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<StrengthTreaningExerciseLine> object) {
    return object
        .map((e) => const StrengthTreaningExerciseLineConverter().toJson(e))
        .toList();
  }
}
