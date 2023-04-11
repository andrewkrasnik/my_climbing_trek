// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_route_roop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MountainRouteRoopModel _$MountainRouteRoopModelFromJson(
        Map<String, dynamic> json) =>
    MountainRouteRoopModel(
      climbingCategory: _$JsonConverterFromJson<String, ClimbingCategory>(
          json['climbingCategory'], const ClimbingCategoryConverter().fromJson),
      iceCategory: _$JsonConverterFromJson<String, IceCategory>(
          json['iceCategory'], const IceCategoryConverter().fromJson),
      length: json['length'] as int,
      slope: json['slope'] as int,
      anchor: json['anchor'] as String? ?? '',
      boltCount: json['boltCount'] as int? ?? 0,
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$MountainRouteRoopModelToJson(
        MountainRouteRoopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'climbingCategory': _$JsonConverterToJson<String, ClimbingCategory>(
          instance.climbingCategory, const ClimbingCategoryConverter().toJson),
      'iceCategory': _$JsonConverterToJson<String, IceCategory>(
          instance.iceCategory, const IceCategoryConverter().toJson),
      'length': instance.length,
      'boltCount': instance.boltCount,
      'anchor': instance.anchor,
      'slope': instance.slope,
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
