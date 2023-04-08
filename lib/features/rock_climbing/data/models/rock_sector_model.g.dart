// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_sector_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockSectorModel _$RockSectorModelFromJson(Map<String, dynamic> json) =>
    RockSectorModel(
      name: json['name'] as String,
      district: const RockDistrictConverter()
          .fromJson(json['district'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      hasBouldering: json['hasBouldering'] as bool? ?? false,
      hasDryTooling: json['hasDryTooling'] as bool? ?? false,
      hasRope: json['hasRope'] as bool? ?? false,
      hasTrad: json['hasTrad'] as bool? ?? false,
    );

Map<String, dynamic> _$RockSectorModelToJson(RockSectorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'district': const DistrictConverter().toJson(instance.district),
      'image': instance.image,
      'hasBouldering': instance.hasBouldering,
      'hasRope': instance.hasRope,
      'hasTrad': instance.hasTrad,
      'hasDryTooling': instance.hasDryTooling,
    };
