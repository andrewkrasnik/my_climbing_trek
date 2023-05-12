// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_sector_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockSectorModel _$RockSectorModelFromJson(Map<String, dynamic> json) =>
    RockSectorModel(
      name: json['name'] as String,
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      hasBouldering: json['hasBouldering'] as bool? ?? false,
      hasDryTooling: json['hasDryTooling'] as bool? ?? false,
      hasRope: json['hasRope'] as bool? ?? false,
      hasTrad: json['hasTrad'] as bool? ?? false,
      hasAid: json['hasAid'] as bool? ?? false,
    );

Map<String, dynamic> _$RockSectorModelToJson(RockSectorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'hasBouldering': instance.hasBouldering,
      'hasRope': instance.hasRope,
      'hasTrad': instance.hasTrad,
      'hasDryTooling': instance.hasDryTooling,
      'hasAid': instance.hasAid,
    };
