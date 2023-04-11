// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IceDistrictModel _$IceDistrictModelFromJson(Map<String, dynamic> json) =>
    IceDistrictModel(
      compact: json['compact'] as bool? ?? false,
      name: json['name'] as String,
      region: const RegionConverter().fromJson(json['region'] as String),
      image: json['image'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$IceDistrictModelToJson(IceDistrictModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': const RegionConverter().toJson(instance.region),
      'image': instance.image,
      'compact': instance.compact,
    };
