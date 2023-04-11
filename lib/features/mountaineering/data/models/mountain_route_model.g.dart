// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MountainRouteModel _$MountainRouteModelFromJson(Map<String, dynamic> json) =>
    MountainRouteModel(
      category: const MountaineeringCategoryConverter()
          .fromJson(json['category'] as String),
      type: const MountainRouteTypeConverter().fromJson(json['type'] as String),
      roops: (json['roops'] as List<dynamic>?)
          ?.map((e) => const MountainRouteRoopConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      id: json['id'] as String? ?? '',
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MountainRouteModelToJson(MountainRouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category':
          const MountaineeringCategoryConverter().toJson(instance.category),
      'type': const MountainRouteTypeConverter().toJson(instance.type),
      'roops': instance.roops
          .map(const MountainRouteRoopConverter().toJson)
          .toList(),
      'image': instance.image,
      'name': instance.name,
    };
