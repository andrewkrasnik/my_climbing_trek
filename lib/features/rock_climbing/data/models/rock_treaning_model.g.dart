// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockTreaningModel _$RockTreaningModelFromJson(Map<String, dynamic> json) =>
    RockTreaningModel(
      date: DateTime.parse(json['date'] as String),
      district: const RockDistrictConverter()
          .fromJson(json['district'] as Map<String, dynamic>),
      attempts: (json['attempts'] as List<dynamic>?)
          ?.map((e) => const RockTreaningAttemptConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      sectors: (json['sectors'] as List<dynamic>)
          .map((e) =>
              const RockSectorConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      finish: json['finish'] == null
          ? null
          : DateTime.parse(json['finish'] as String),
      id: json['id'] as String? ?? '',
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
    );

Map<String, dynamic> _$RockTreaningModelToJson(RockTreaningModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'finish': instance.finish?.toIso8601String(),
      'district': const RockDistrictConverter().toJson(instance.district),
      'sectors':
          instance.sectors.map(const RockSectorConverter().toJson).toList(),
      'attempts': instance.attempts
          .map(const RockTreaningAttemptConverter().toJson)
          .toList(),
    };
