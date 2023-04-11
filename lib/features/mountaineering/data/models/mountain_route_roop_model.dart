import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';

part 'mountain_route_roop_model.g.dart';

@JsonSerializable(converters: [
  IceCategoryConverter(),
  ClimbingCategoryConverter(),
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
  });

  factory MountainRouteRoopModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteRoopModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteRoopModelToJson(this);
}
