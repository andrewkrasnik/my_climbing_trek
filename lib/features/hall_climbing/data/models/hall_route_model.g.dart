// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HallRouteModel _$HallRouteModelFromJson(Map<String, dynamic> json) =>
    HallRouteModel(
      category: const DifficultyCategoryConverter()
          .fromJson(json['category'] as String),
      color: const RouteColorConverter().fromJson(json['color'] as String),
      type: const ClimbingRouteTypeConverter().fromJson(json['type'] as String),
      sectorNumber: (json['sectorNumber'] as num?)?.toInt() ?? 0,
      archive: json['archive'] as bool? ?? false,
      autoBelay: json['autoBelay'] as bool? ?? false,
      author: json['author'] as String? ?? '',
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      description: json['description'] as String? ?? '',
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$HallRouteModelToJson(HallRouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': const DifficultyCategoryConverter().toJson(instance.category),
      'type': const ClimbingRouteTypeConverter().toJson(instance.type),
      'color': const RouteColorConverter().toJson(instance.color),
      'sectorNumber': instance.sectorNumber,
      'archive': instance.archive,
      'autoBelay': instance.autoBelay,
      'description': instance.description,
      'name': instance.name,
      'author': instance.author,
      'createDate': instance.createDate?.toIso8601String(),
    };
