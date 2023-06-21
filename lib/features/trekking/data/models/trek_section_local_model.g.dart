// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trek_section_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrekSectionLocalModel _$TrekSectionLocalModelFromJson(
        Map<String, dynamic> json) =>
    TrekSectionLocalModel(
      start: const TrekPointConverter()
          .fromJson(json['start'] as Map<String, dynamic>),
      finish: const TrekPointConverter()
          .fromJson(json['finish'] as Map<String, dynamic>),
      length: (json['length'] as num).toDouble(),
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$TrekSectionLocalModelToJson(
        TrekSectionLocalModel instance) =>
    <String, dynamic>{
      'start': const TrekPointConverter().toJson(instance.start),
      'finish': const TrekPointConverter().toJson(instance.finish),
      'length': instance.length,
      'description': instance.description,
    };
