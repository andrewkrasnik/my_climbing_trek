// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechniqueOptionModel _$TechniqueOptionModelFromJson(
        Map<String, dynamic> json) =>
    TechniqueOptionModel(
      name: json['name'] as String,
      description: json['description'] as String?,
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$TechniqueOptionModelToJson(
        TechniqueOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
