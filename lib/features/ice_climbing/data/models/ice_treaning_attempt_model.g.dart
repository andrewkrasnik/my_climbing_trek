// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_treaning_attempt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IceTreaningAttemptModel _$IceTreaningAttemptModelFromJson(
        Map<String, dynamic> json) =>
    IceTreaningAttemptModel(
      treaningId: json['treaningId'] as String,
      sector:
          const IceSectorStringConverter().fromJson(json['sector'] as String),
      category:
          const IceCategoryConverter().fromJson(json['category'] as String),
      style: const ClimbingStyleConverter().fromJson(json['style'] as String),
      startTime: _$JsonConverterFromJson<int, DateTime>(
          json['startTime'], const EpochDateTimeConverter().fromJson),
      finishTime: _$JsonConverterFromJson<int, DateTime>(
          json['finishTime'], const EpochDateTimeConverter().fromJson),
      wayLength: (json['wayLength'] as num?)?.toInt(),
      id: json['id'] as String? ?? '',
      downClimbing: json['downClimbing'] as bool? ?? false,
      fallCount: (json['fallCount'] as num?)?.toInt() ?? 0,
      iceScrewsCount: (json['iceScrewsCount'] as num?)?.toInt() ?? 0,
      fail: json['fail'] as bool? ?? false,
      installedIceScrews: json['installedIceScrews'] as bool? ?? false,
      suspensionCount: (json['suspensionCount'] as num?)?.toInt() ?? 0,
      toolsCount: (json['toolsCount'] as num?)?.toInt() ?? 2,
      sectorId: json['sectorId'] as String? ?? '',
    );

Map<String, dynamic> _$IceTreaningAttemptModelToJson(
        IceTreaningAttemptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sector': const IceSectorStringConverter().toJson(instance.sector),
      'category': const IceCategoryConverter().toJson(instance.category),
      'style': const ClimbingStyleConverter().toJson(instance.style),
      'treaningId': instance.treaningId,
      'suspensionCount': instance.suspensionCount,
      'fallCount': instance.fallCount,
      'downClimbing': instance.downClimbing,
      'fail': instance.fail,
      'toolsCount': instance.toolsCount,
      'iceScrewsCount': instance.iceScrewsCount,
      'installedIceScrews': instance.installedIceScrews,
      'wayLength': instance.wayLength,
      'startTime': _$JsonConverterToJson<int, DateTime>(
          instance.startTime, const EpochDateTimeConverter().toJson),
      'finishTime': _$JsonConverterToJson<int, DateTime>(
          instance.finishTime, const EpochDateTimeConverter().toJson),
      'sectorId': instance.sectorId,
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
