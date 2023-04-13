// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HallTreaningModel _$HallTreaningModelFromJson(Map<String, dynamic> json) =>
    HallTreaningModel(
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      climbingHall:
          const GumStringConverter().fromJson(json['climbingHall'] as String),
      attempts: (json['attempts'] as List<dynamic>)
          .map((e) => const ClimbingHallAttemptConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String? ?? '',
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      hallId: json['hallId'] as String? ?? '',
    );

Map<String, dynamic> _$HallTreaningModelToJson(HallTreaningModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'climbingHall': const GumStringConverter().toJson(instance.climbingHall),
      'attempts': instance.attempts
          .map(const ClimbingHallAttemptConverter().toJson)
          .toList(),
      'hallId': instance.hallId,
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
