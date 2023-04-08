// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_treaning_attempt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockTreaningAttemptModel _$RockTreaningAttemptModelFromJson(
        Map<String, dynamic> json) =>
    RockTreaningAttemptModel(
      sector: const RockSectorConverter()
          .fromJson(json['sector'] as Map<String, dynamic>),
      category:
          const ClimbingCategoryConverter().fromJson(json['category'] as int),
      style: const ClimbingStyleConverter().fromJson(json['style'] as int),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      finishTime: json['finishTime'] == null
          ? null
          : DateTime.parse(json['finishTime'] as String),
      id: json['id'] as String? ?? '',
      route: _$JsonConverterFromJson<Map<String, dynamic>, RockRoute>(
          json['route'], const RockRouteConverter().fromJson),
      downClimbing: json['downClimbing'] as bool? ?? false,
      fallCount: json['fallCount'] as int? ?? 0,
      fail: json['fail'] as bool? ?? false,
      suspensionCount: json['suspensionCount'] as int? ?? 0,
    );

Map<String, dynamic> _$RockTreaningAttemptModelToJson(
        RockTreaningAttemptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sector': const RockSectorConverter().toJson(instance.sector),
      'category': const ClimbingCategoryConverter().toJson(instance.category),
      'style': const ClimbingStyleConverter().toJson(instance.style),
      'route': _$JsonConverterToJson<Map<String, dynamic>, RockRoute>(
          instance.route, const RockRouteConverter().toJson),
      'suspensionCount': instance.suspensionCount,
      'fallCount': instance.fallCount,
      'downClimbing': instance.downClimbing,
      'fail': instance.fail,
      'startTime': instance.startTime?.toIso8601String(),
      'finishTime': instance.finishTime?.toIso8601String(),
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
