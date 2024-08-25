// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_attempt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HallAttemptModel _$HallAttemptModelFromJson(Map<String, dynamic> json) =>
    HallAttemptModel(
      category: const DifficultyCategoryConverter()
          .fromJson(json['category'] as String),
      style: const ClimbingStyleConverter().fromJson(json['style'] as String),
      treaningId: json['treaningId'] as String,
      route: _$JsonConverterFromJson<String, ClimbingHallRoute>(
          json['route'], const GumRouteStringConverter().fromJson),
      ascentType: _$JsonConverterFromJson<String, AscentType>(
          json['ascentType'], const AscentTypeConverter().fromJson),
      downClimbing: json['downClimbing'] as bool? ?? false,
      fail: json['fail'] as bool? ?? false,
      fallCount: (json['fallCount'] as num?)?.toInt() ?? 0,
      finishTime: _$JsonConverterFromJson<int, DateTime>(
          json['finishTime'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      startTime: _$JsonConverterFromJson<int, DateTime>(
          json['startTime'], const EpochDateTimeConverter().fromJson),
      suspensionCount: (json['suspensionCount'] as num?)?.toInt() ?? 0,
      routeId: json['routeId'] as String? ?? '',
    );

Map<String, dynamic> _$HallAttemptModelToJson(HallAttemptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route': _$JsonConverterToJson<String, ClimbingHallRoute>(
          instance.route, const GumRouteStringConverter().toJson),
      'category': const DifficultyCategoryConverter().toJson(instance.category),
      'treaningId': instance.treaningId,
      'startTime': _$JsonConverterToJson<int, DateTime>(
          instance.startTime, const EpochDateTimeConverter().toJson),
      'finishTime': _$JsonConverterToJson<int, DateTime>(
          instance.finishTime, const EpochDateTimeConverter().toJson),
      'ascentType': _$JsonConverterToJson<String, AscentType>(
          instance.ascentType, const AscentTypeConverter().toJson),
      'suspensionCount': instance.suspensionCount,
      'fallCount': instance.fallCount,
      'downClimbing': instance.downClimbing,
      'fail': instance.fail,
      'style': const ClimbingStyleConverter().toJson(instance.style),
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
