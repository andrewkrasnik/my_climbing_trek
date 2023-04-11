// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strength_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrengthTreaningModel _$StrengthTreaningModelFromJson(
        Map<String, dynamic> json) =>
    StrengthTreaningModel(
      id: json['id'] as String? ?? '',
      attempts: (json['attempts'] as List<dynamic>?)
          ?.map((e) => const StrengthTreaningExerciseLineConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StrengthTreaningModelToJson(
        StrengthTreaningModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'attempts': instance.attempts
          .map(const StrengthTreaningExerciseLineConverter().toJson)
          .toList(),
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
