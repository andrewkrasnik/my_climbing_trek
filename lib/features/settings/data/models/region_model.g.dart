// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      name: json['name'] as String,
      id: json['id'] as String? ?? '',
      image: json['image'] as String?,
      hasEditPermission: json['hasEditPermission'] as bool? ?? false,
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'hasEditPermission': instance.hasEditPermission,
    };
