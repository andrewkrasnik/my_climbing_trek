// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trekking_path_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrekkingPathModel _$TrekkingPathModelFromJson(Map<String, dynamic> json) =>
    TrekkingPathModel(
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      region: const RegionConverter().fromJson(json['region'] as String),
      type: const TrekkingTypeConverter().fromJson(json['type'] as String),
      climbDown: json['climbDown'] as int? ?? 0,
      climbUp: json['climbUp'] as int? ?? 0,
      currentSection: _$JsonConverterFromJson<String, TrekSection>(
          json['currentSection'], const TrekSectionStringConverter().fromJson),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => const TrekkingPathEventConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      length: (json['length'] as num?)?.toDouble() ?? 0,
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      trek: _$JsonConverterFromJson<String, Trek>(
          json['trek'], const TrekStringConverter().fromJson),
      turn: json['turn'] as bool? ?? false,
      trekId: json['trekId'] as String? ?? '',
    );

Map<String, dynamic> _$TrekkingPathModelToJson(TrekkingPathModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'region': const RegionConverter().toJson(instance.region),
      'trek': _$JsonConverterToJson<String, Trek>(
          instance.trek, const TrekStringConverter().toJson),
      'events': instance.events
          .map(const TrekkingPathEventConverter().toJson)
          .toList(),
      'type': const TrekkingTypeConverter().toJson(instance.type),
      'length': instance.length,
      'climbUp': instance.climbUp,
      'climbDown': instance.climbDown,
      'currentSection': _$JsonConverterToJson<String, TrekSection>(
          instance.currentSection, const TrekSectionStringConverter().toJson),
      'turn': instance.turn,
      'trekId': instance.trekId,
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
