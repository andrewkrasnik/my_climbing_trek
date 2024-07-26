// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RockRouteModel _$RockRouteModelFromJson(Map<String, dynamic> json) =>
    RockRouteModel(
      name: json['name'] as String,
      category: const DifficultyCategoryConverter()
          .fromJson(json['category'] as String),
      type: const ClimbingRouteTypeConverter().fromJson(json['type'] as String),
      id: json['id'] as String? ?? '',
      anchor: json['anchor'] as String? ?? '',
      length: (json['length'] as num?)?.toInt() ?? 0,
      boltCount: (json['boltCount'] as num?)?.toInt() ?? 0,
      number: (json['number'] as num?)?.toInt(),
      remark: json['remark'] as String? ?? '',
      author: json['author'] as String? ?? '',
    );

Map<String, dynamic> _$RockRouteModelToJson(RockRouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': const DifficultyCategoryConverter().toJson(instance.category),
      'type': const ClimbingRouteTypeConverter().toJson(instance.type),
      'author': instance.author,
      'boltCount': instance.boltCount,
      'anchor': instance.anchor,
      'name': instance.name,
      'number': instance.number,
      'length': instance.length,
      'remark': instance.remark,
    };
