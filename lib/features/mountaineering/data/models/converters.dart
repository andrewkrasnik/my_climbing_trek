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
    return MountainRoutePieceModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MountainRoutePiece object) {
    return (object as MountainRoutePieceModel).toJson();
  }
}
