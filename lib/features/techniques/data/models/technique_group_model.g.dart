// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechniqueGroupModel _$TechniqueGroupModelFromJson(Map<String, dynamic> json) =>
    TechniqueGroupModel(
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as String? ?? '',
      image: json['image'] as String,
      localData: json['localData'] as bool? ?? false,
    );

Map<String, dynamic> _$TechniqueGroupModelToJson(
        TechniqueGroupModel instance) =>
    <String, dynamic>{
      'localData': instance.localData,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
