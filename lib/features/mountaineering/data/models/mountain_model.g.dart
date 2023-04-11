// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MountainModel _$MountainModelFromJson(Map<String, dynamic> json) =>
    MountainModel(
      region: const RegionConverter().fromJson(json['region'] as String),
      name: json['name'] as String,
      altitude: json['altitude'] as int,
      image: json['image'] as String,
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$MountainModelToJson(MountainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': const RegionConverter().toJson(instance.region),
      'name': instance.name,
      'altitude': instance.altitude,
      'image': instance.image,
    };
