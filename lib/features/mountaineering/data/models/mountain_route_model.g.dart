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
      aidCategory: _$JsonConverterFromJson<String, AidCategory>(
          json['aidCategory'], const AidCategoryConverter().fromJson),
      author: json['author'] as String? ?? '',
      climbingCategory: _$JsonConverterFromJson<String, ClimbingCategory>(
          json['climbingCategory'], const ClimbingCategoryConverter().fromJson),
      descent: json['descent'] as String? ?? '',
      description: json['description'] as String? ?? '',
      firstAscentYear: json['firstAscentYear'] as String? ?? '',
      length: json['length'] as int? ?? 0,
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      passage: json['passage'] as String? ?? '',
      ueaaSchemaImage: json['ueaaSchemaImage'] as String?,
      ussrCategory: _$JsonConverterFromJson<String, UssrClimbingCategory>(
          json['ussrCategory'], const UssrClimbingCategoryConverter().fromJson),
      farLink: json['farLink'] as String?,
    );

Map<String, dynamic> _$MountainRouteModelToJson(MountainRouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category':
          const MountaineeringCategoryConverter().toJson(instance.category),
      'climbingCategory': _$JsonConverterToJson<String, ClimbingCategory>(
          instance.climbingCategory, const ClimbingCategoryConverter().toJson),
      'aidCategory': _$JsonConverterToJson<String, AidCategory>(
          instance.aidCategory, const AidCategoryConverter().toJson),
      'ussrCategory': _$JsonConverterToJson<String, UssrClimbingCategory>(
          instance.ussrCategory, const UssrClimbingCategoryConverter().toJson),
      'type': const MountainRouteTypeConverter().toJson(instance.type),
      'roops': instance.roops
          .map(const MountainRouteRoopConverter().toJson)
          .toList(),
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'passage': instance.passage,
      'descent': instance.descent,
      'author': instance.author,
      'firstAscentYear': instance.firstAscentYear,
      'length': instance.length,
      'ueaaSchemaImage': instance.ueaaSchemaImage,
      'farLink': instance.farLink,
      'links': instance.links,
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
