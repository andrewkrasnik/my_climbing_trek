// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HallModel _$HallModelFromJson(Map<String, dynamic> json) => HallModel(
      name: json['name'] as String,
      address: json['address'] as String,
      city: City.fromJson(json['city']),
      image: json['image'] as String,
      telephone: json['telephone'] as String,
      website: json['website'] as String,
      email: json['email'] as String,
      hasBigWall: json['hasBigWall'] as bool? ?? false,
      hasBouldering: json['hasBouldering'] as bool? ?? false,
      hasSpeed: json['hasSpeed'] as bool? ?? false,
      hasAutoBelay: json['hasAutoBelay'] as bool? ?? false,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$HallModelToJson(HallModel instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'hasBouldering': instance.hasBouldering,
      'hasBigWall': instance.hasBigWall,
      'hasSpeed': instance.hasSpeed,
      'hasAutoBelay': instance.hasAutoBelay,
      'image': instance.image,
      'telephone': instance.telephone,
      'website': instance.website,
      'email': instance.email,
      'id': instance.id,
    };
