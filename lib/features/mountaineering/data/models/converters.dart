import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_route_roop_model.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';

class MountainRouteTypeConverter
    implements JsonConverter<MountainRouteType, String> {
  const MountainRouteTypeConverter();
  @override
  MountainRouteType fromJson(String json) {
    return MountainRouteType.getById(json);
  }

  @override
  String toJson(MountainRouteType object) {
    return object.id;
  }
}

class MountaineeringCategoryConverter
    implements JsonConverter<MountaineeringCategory, String> {
  const MountaineeringCategoryConverter();
  @override
  MountaineeringCategory fromJson(String json) {
    return MountaineeringCategory.getById(json);
  }

  @override
  String toJson(MountaineeringCategory object) {
    return object.id;
  }
}

class RoutePieceTypeConverter implements JsonConverter<RoutePieceType, String> {
  const RoutePieceTypeConverter();
  @override
  RoutePieceType fromJson(String json) {
    switch (json) {
      case 'ice':
        return RoutePieceType.ice;
      case 'rock':
        return RoutePieceType.ice;
      case 'mixed':
        return RoutePieceType.ice;
      default:
        throw 'No converter for RoutePieceType: $json';
    }
  }

  @override
  String toJson(RoutePieceType object) {
    return object.name;
  }
}

class MountainRouteRoopConverter
    implements JsonConverter<MountainRouteRoop, Map<String, dynamic>> {
  const MountainRouteRoopConverter();
  @override
  MountainRouteRoop fromJson(Map<String, dynamic> json) {
    return MountainRouteRoopModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MountainRouteRoop object) {
    return (object as MountainRouteRoopModel).toJson();
  }
}

class MountainRoutePieceConverter
    implements JsonConverter<MountainRoutePiece, Map<String, dynamic>> {
  const MountainRoutePieceConverter();
  @override
  MountainRoutePiece fromJson(Map<String, dynamic> json) {
    final String type = json['type'];
    switch (type) {
      case 'ice':
        return MountainRouteIcePieceModel.fromJson(json);
      case 'rock':
        return MountainRouteRockPieceModel.fromJson(json);
      case 'mixed':
        return MountainRouteMixedPieceModel.fromJson(json);
      default:
        throw 'No converter for MountainRoutePiece with type: $type';
    }
  }

  @override
  Map<String, dynamic> toJson(MountainRoutePiece object) {
    switch (object.type) {
      case RoutePieceType.ice:
        return (this as MountainRouteIcePieceModel).toJson();
      case RoutePieceType.rock:
        return (this as MountainRouteRockPieceModel).toJson();
      case RoutePieceType.mixed:
        return (this as MountainRouteMixedPieceModel).toJson();
      default:
        throw 'No converter for MountainRoutePiece with type: ${object.type}';
    }
  }
}
