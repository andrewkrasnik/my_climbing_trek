// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strength_exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrengthExerciseModel _$StrengthExerciseModelFromJson(
        Map<String, dynamic> json) =>
    StrengthExerciseModel(
      selected: json['selected'] as bool,
      name: json['name'] as String,
      repetitions: json['repetitions'] as int,
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$StrengthExerciseModelToJson(
        StrengthExerciseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'repetitions': instance.repetitions,
      'id': instance.id,
      'selected': instance.selected,
    };
