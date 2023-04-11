// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardio_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardioTreaningModel _$CardioTreaningModelFromJson(Map<String, dynamic> json) =>
    CardioTreaningModel(
      id: json['id'] as String? ?? '',
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      duration: json['duration'] as int,
      exercise:
          const CardioExerciseConverter().fromJson(json['exercise'] as String),
      length: (json['length'] as num).toDouble(),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$CardioTreaningModelToJson(
        CardioTreaningModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'duration': instance.duration,
      'exercise': const CardioExerciseConverter().toJson(instance.exercise),
      'length': instance.length,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
