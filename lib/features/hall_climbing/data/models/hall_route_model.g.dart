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
      sectorNumber: json['sectorNumber'] as int? ?? 0,
      archive: json['archive'] as bool? ?? false,
      autoBelay: json['autoBelay'] as bool? ?? false,
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
    };
