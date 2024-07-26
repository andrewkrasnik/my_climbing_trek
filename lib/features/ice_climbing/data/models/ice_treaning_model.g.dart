// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IceTreaningModel _$IceTreaningModelFromJson(Map<String, dynamic> json) =>
    IceTreaningModel(
      district: const IceDistrictStringConverter()
          .fromJson(json['district'] as String),
      date: const EpochDateTimeConverter()
          .fromJson((json['date'] as num).toInt()),
      sectors: _$JsonConverterFromJson<String, List<IceSector>>(
          json['sectors'], const IceSectorsStringConverter().fromJson),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      attempts: (json['attempts'] as List<dynamic>?)
          ?.map((e) => const IceTreaningAttemptConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      districtId: json['districtId'] as String? ?? '',
    );

Map<String, dynamic> _$IceTreaningModelToJson(IceTreaningModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'district': const IceDistrictStringConverter().toJson(instance.district),
      'sectors': const IceSectorsStringConverter().toJson(instance.sectors),
      'attempts': instance.attempts
          .map(const IceTreaningAttemptConverter().toJson)
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
