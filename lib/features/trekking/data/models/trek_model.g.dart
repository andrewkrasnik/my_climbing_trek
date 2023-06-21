// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trek_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrekModel _$TrekModelFromJson(Map<String, dynamic> json) => TrekModel(
      name: json['name'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) =>
              const TrekSectionConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      region: const RegionConverter().fromJson(json['region'] as String),
      type: const TrekkingTypeConverter().fromJson(json['type'] as String),
      id: json['id'] as String? ?? '',
      image: json['image'] as String?,
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mapImage: json['mapImage'] as String?,
    );

Map<String, dynamic> _$TrekModelToJson(TrekModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sections':
          instance.sections.map(const TrekSectionConverter().toJson).toList(),
      'region': const RegionConverter().toJson(instance.region),
      'image': instance.image,
      'mapImage': instance.mapImage,
      'links': instance.links,
      'type': const TrekkingTypeConverter().toJson(instance.type),
    };
