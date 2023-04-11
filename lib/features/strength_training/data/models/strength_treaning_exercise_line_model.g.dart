// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strength_treaning_exercise_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrengthTreaningExerciseLineModel _$StrengthTreaningExerciseLineModelFromJson(
        Map<String, dynamic> json) =>
    StrengthTreaningExerciseLineModel(
      treaningId: json['treaningId'] as String,
      exercise: const StrengthExerciseStringConverter()
          .fromJson(json['exercise'] as String),
      repetitions: _$JsonConverterFromJson<String, List<int>>(
          json['repetitions'], const RepetitionsStringConverter().fromJson),
      id: json['id'] as String? ?? '',
      exerciseId: json['exerciseId'] as String? ?? '',
    );

Map<String, dynamic> _$StrengthTreaningExerciseLineModelToJson(
        StrengthTreaningExerciseLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treaningId': instance.treaningId,
      'exercise':
          const StrengthExerciseStringConverter().toJson(instance.exercise),
      'repetitions':
          const RepetitionsStringConverter().toJson(instance.repetitions),
      'exerciseId': instance.exerciseId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
