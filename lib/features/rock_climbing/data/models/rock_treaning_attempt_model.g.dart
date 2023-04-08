// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_treaning_attempt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockTreaningAttemptModel _$RockTreaningAttemptModelFromJson(
        Map<String, dynamic> json) =>
    RockTreaningAttemptModel(
      treaningId: json['treaningId'] as String,
      sector:
          const RockSectorStringConverter().fromJson(json['sector'] as String),
      category: const ClimbingCategoryConverter()
          .fromJson(json['category'] as String),
      style: const ClimbingStyleConverter().fromJson(json['style'] as String),
      startTime: _$JsonConverterFromJson<int, DateTime>(
          json['startTime'], const EpochDateTimeConverter().fromJson),
      finishTime: _$JsonConverterFromJson<int, DateTime>(
          json['finishTime'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      route: _$JsonConverterFromJson<String, RockRoute>(
          json['route'], const RockRouteStringConverter().fromJson),
      downClimbing: json['downClimbing'] as bool? ?? false,
      fallCount: json['fallCount'] as int? ?? 0,
      fail: json['fail'] as bool? ?? false,
      suspensionCount: json['suspensionCount'] as int? ?? 0,
      sectorId: json['sectorId'] as String? ?? '',
      routeId: json['routeId'] as String? ?? '',
    );

Map<String, dynamic> _$RockTreaningAttemptModelToJson(
        RockTreaningAttemptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sector': const RockSectorStringConverter().toJson(instance.sector),
      'category': const ClimbingCategoryConverter().toJson(instance.category),
      'style': const ClimbingStyleConverter().toJson(instance.style),
      'route': _$JsonConverterToJson<String, RockRoute>(
          instance.route, const RockRouteStringConverter().toJson),
      'treaningId': instance.treaningId,
      'suspensionCount': instance.suspensionCount,
      'fallCount': instance.fallCount,
      'downClimbing': instance.downClimbing,
      'fail': instance.fail,
      'startTime': _$JsonConverterToJson<int, DateTime>(
          instance.startTime, const EpochDateTimeConverter().toJson),
      'finishTime': _$JsonConverterToJson<int, DateTime>(
          instance.finishTime, const EpochDateTimeConverter().toJson),
      'sectorId': instance.sectorId,
      'routeId': instance.routeId,
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
