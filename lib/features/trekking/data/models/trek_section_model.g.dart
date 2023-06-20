// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trek_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrekSectionModel _$TrekSectionModelFromJson(Map<String, dynamic> json) =>
    TrekSectionModel(
      start: const TrekPointStringConverter().fromJson(json['start'] as String),
      finish:
          const TrekPointStringConverter().fromJson(json['finish'] as String),
      length: (json['length'] as num).toDouble(),
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$TrekSectionModelToJson(TrekSectionModel instance) =>
    <String, dynamic>{
      'start': const TrekPointStringConverter().toJson(instance.start),
      'finish': const TrekPointStringConverter().toJson(instance.finish),
      'length': instance.length,
      'description': instance.description,
    };
