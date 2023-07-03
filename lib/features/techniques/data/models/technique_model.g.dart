// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechniqueModel _$TechniqueModelFromJson(Map<String, dynamic> json) =>
    TechniqueModel(
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as String? ?? '',
      image: json['image'] as String?,
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => const TechniqueOptionConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TechniqueModelToJson(TechniqueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'options': instance.options
          .map(const TechniqueOptionConverter().toJson)
          .toList(),
      'links': instance.links,
    };
