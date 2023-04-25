import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';

part 'mountain_route_model.g.dart';

@JsonSerializable(converters: [
  MountainRouteTypeConverter(),
  MountaineeringCategoryConverter(),
  MountainRouteRoopConverter(),
  AidCategoryConverter(),
  UssrClimbingCategoryConverter(),
  ClimbingCategoryConverter(),
])
class MountainRouteModel extends MountainRoute {
  MountainRouteModel({
    required super.category,
    required super.type,
    List<MountainRouteRoop>? roops,
    required super.name,
    super.id,
    super.image,
    super.aidCategory,
    super.author,
    super.climbingCategory,
    super.descent,
    super.description,
    super.firstAscentYear,
    super.length,
    super.links,
    super.passage,
    super.ueaaSchemaImage,
    super.ussrCategory,
    super.farLink,
  }) : super(roops: roops ?? []);

  factory MountainRouteModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteModelToJson(this);
}
