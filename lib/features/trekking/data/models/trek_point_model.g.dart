// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trek_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrekPointModel _$TrekPointModelFromJson(Map<String, dynamic> json) =>
    TrekPointModel(
      name: json['name'] as String,
      type: const TrekPointTypeConverter().fromJson(json['type'] as String),
      altitude: json['altitude'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => const TrekPointFeatureConverter().fromJson(e as String))
          .toList(),
      id: json['id'] as String? ?? '',
      image: json['image'] as String?,
      mapPoint: _$JsonConverterFromJson<Map<String, dynamic>, MapPoint>(
          json['mapPoint'], const MapPointConverter().fromJson),
    );

Map<String, dynamic> _$TrekPointModelToJson(TrekPointModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mapPoint': _$JsonConverterToJson<Map<String, dynamic>, MapPoint>(
          instance.mapPoint, const MapPointConverter().toJson),
      'altitude': instance.altitude,
      'type': const TrekPointTypeConverter().toJson(instance.type),
      'features': instance.features
          .map(const TrekPointFeatureConverter().toJson)
          .toList(),
      'description': instance.description,
      'image': instance.image,
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
