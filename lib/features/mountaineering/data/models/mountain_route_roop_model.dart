import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';

part 'mountain_route_roop_model.g.dart';

@JsonSerializable(converters: [
  IceCategoryConverter(),
  ClimbingCategoryConverter(),
  MountainRoutePieceConverter(),
])
class MountainRouteRoopModel extends MountainRouteRoop {
  MountainRouteRoopModel({
    super.climbingCategory,
    super.iceCategory,
    required super.length,
    super.slope,
    super.anchor,
    super.boltCount,
    super.id,
    super.description,
    required super.number,
    super.pieces,
    super.icePrefix,
  });

  factory MountainRouteRoopModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteRoopModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteRoopModelToJson(this);
}

@JsonSerializable(converters: [
  IceCategoryConverter(),
  RoutePieceTypeConverter(),
])
class MountainRouteIcePieceModel extends MountainRouteIcePiece {
  MountainRouteIcePieceModel({
    required super.length,
    super.slope,
    required super.category,
    required RoutePieceType type,
  });

  factory MountainRouteIcePieceModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteIcePieceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteIcePieceModelToJson(this);
}

@JsonSerializable(converters: [
  AidCategoryConverter(),
  UssrClimbingCategoryConverter(),
  ClimbingCategoryConverter(),
  RoutePieceTypeConverter(),
])
class MountainRouteRockPieceModel extends MountainRouteRockPiece {
  MountainRouteRockPieceModel({
    required super.length,
    super.aidCategory,
    super.climbingCategory,
    super.ussrCategory,
    super.slope,
    required RoutePieceType type,
  });

  factory MountainRouteRockPieceModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteRockPieceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteRockPieceModelToJson(this);
}

@JsonSerializable(converters: [
  MixedCategoryConverter(),
  RoutePieceTypeConverter(),
])
class MountainRouteMixedPieceModel extends MountainRouteMixedPiece {
  MountainRouteMixedPieceModel({
    required super.category,
    required super.length,
    super.slope,
    required RoutePieceType type,
  });

  factory MountainRouteMixedPieceModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteMixedPieceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteMixedPieceModelToJson(this);
}
