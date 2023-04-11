// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockTreaningModel _$RockTreaningModelFromJson(Map<String, dynamic> json) =>
    RockTreaningModel(
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      district: const RockDistrictStringConverter()
          .fromJson(json['district'] as String),
      sectors: _$JsonConverterFromJson<String, List<RockSector>>(
          json['sectors'], const RockSectorsStringConverter().fromJson),
      attempts: (json['attempts'] as List<dynamic>?)
          ?.map((e) => const RockTreaningAttemptConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      districtId: json['districtId'] as String? ?? '',
    );

Map<String, dynamic> _$RockTreaningModelToJson(RockTreaningModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'district': const RockDistrictStringConverter().toJson(instance.district),
      'sectors': const RockSectorsStringConverter().toJson(instance.sectors),
      'attempts': instance.attempts
          .map(const RockTreaningAttemptConverter().toJson)
          .toList(),
      'districtId': instance.districtId,
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
