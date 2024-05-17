// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockDistrictModel _$RockDistrictModelFromJson(Map<String, dynamic> json) =>
    RockDistrictModel(
      compact: json['compact'] as bool? ?? false,
      name: json['name'] as String,
      region: const RegionConverter().fromJson(json['region'] as String),
      mapPoint: _$JsonConverterFromJson<Map<String, dynamic>, MapPoint>(
          json['mapPoint'], const MapPointConverter().fromJson),
      image: json['image'] as String? ?? '',
      id: json['id'] as String? ?? '',
      hasEditPermission: json['hasEditPermission'] as bool? ?? false,
    );

Map<String, dynamic> _$RockDistrictModelToJson(RockDistrictModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': const RegionConverter().toJson(instance.region),
      'image': instance.image,
      'hasEditPermission': instance.hasEditPermission,
      'compact': instance.compact,
      'mapPoint': _$JsonConverterToJson<Map<String, dynamic>, MapPoint>(
          instance.mapPoint, const MapPointConverter().toJson),
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
