import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/places_repository.dart';
import 'package:my_climbing_trek/service_locator.dart';

class HallModel extends ClimbingHall {
  const HallModel({
    required super.name,
    required super.address,
    required super.city,
    required super.image,
    required super.telephone,
    required super.website,
    required super.email,
    super.hasBigWall,
    super.hasBouldering,
    super.hasSpeed,
    super.hasAutoBelay,
    super.id,
    super.hasEditPermission,
  }) : super(point: const MapPoint(latitude: 0, longitude: 0));

  factory HallModel.fromJson(
    Map<String, dynamic> json, {
    int? id,
    bool? hasEditPermission,
  }) =>
      _$HallModelFromJson(
        json,
        id: id,
        hasEditPermission: hasEditPermission,
      );

  Map<String, dynamic> toJson() => _$HallModelToJson(this);
}

HallModel _$HallModelFromJson(
  Map<String, dynamic> json, {
  int? id,
  bool? hasEditPermission,
}) =>
    HallModel(
      name: json['name'] as String,
      address: json['address'] as String,
      city: getIt<PlacesRepository>().cityById(json['city']),
      image: json['image'] as String,
      telephone: json['telephone'] as String,
      website: json['website'] as String,
      email: json['email'] as String,
      hasBigWall: json['hasBigWall'] as bool? ?? false,
      hasBouldering: json['hasBouldering'] as bool? ?? false,
      hasSpeed: json['hasSpeed'] as bool? ?? false,
      hasAutoBelay: json['hasAutoBelay'] as bool? ?? false,
      id: id ?? json['id'],
      hasEditPermission:
          (hasEditPermission ?? json['hasEditPermission']) ?? false,
    );

Map<String, dynamic> _$HallModelToJson(HallModel instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city.id,
      'hasBouldering': instance.hasBouldering,
      'hasBigWall': instance.hasBigWall,
      'hasSpeed': instance.hasSpeed,
      'hasAutoBelay': instance.hasAutoBelay,
      'image': instance.image,
      'telephone': instance.telephone,
      'website': instance.website,
      'email': instance.email,
      'id': instance.id,
      'hasEditPermission': instance.hasEditPermission,
    };
