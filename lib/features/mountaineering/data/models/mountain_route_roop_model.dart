import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
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
    required super.slope,
    super.anchor,
    super.boltCount,
    super.id,
    super.description,
    required super.number,
    super.pieces,
  });

  factory MountainRouteRoopModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteRoopModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteRoopModelToJson(this);
}

@JsonSerializable(converters: [
  IceCategoryConverter(),
  ClimbingCategoryConverter(),
])
class MountainRoutePieceModel extends MountainRoutePiece {
  MountainRoutePieceModel({
    required super.type,
    required super.length,
  });

  factory MountainRoutePieceModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRoutePieceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRoutePieceModelToJson(this);
}
