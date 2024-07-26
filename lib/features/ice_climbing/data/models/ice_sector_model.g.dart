// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_sector_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IceSectorModel _$IceSectorModelFromJson(Map<String, dynamic> json) =>
    IceSectorModel(
      name: json['name'] as String,
      length: (json['length'] as num).toInt(),
      maxCategory:
          const IceCategoryConverter().fromJson(json['maxCategory'] as String),
      image: json['image'] as String? ?? '',
      waterfallIce: json['waterfallIce'] as bool? ?? false,
      glacierIce: json['glacierIce'] as bool? ?? false,
      artificialIce: json['artificialIce'] as bool? ?? false,
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$IceSectorModelToJson(IceSectorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'waterfallIce': instance.waterfallIce,
      'glacierIce': instance.glacierIce,
      'artificialIce': instance.artificialIce,
      'description': instance.description,
      'length': instance.length,
      'maxCategory': const IceCategoryConverter().toJson(instance.maxCategory),
    };
