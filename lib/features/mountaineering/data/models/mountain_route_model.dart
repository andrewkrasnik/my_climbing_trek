import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';

part 'mountain_route_model.g.dart';

@JsonSerializable(converters: [
  MountainRouteTypeConverter(),
  MountaineeringCategoryConverter(),
  MountainRouteRoopConverter(),
])
class MountainRouteModel extends MountainRoute {
  MountainRouteModel({
    required super.category,
    required super.type,
    List<MountainRouteRoop>? roops,
    required super.name,
    super.id,
    super.image,
  }) : super(roops: roops ?? []);

  factory MountainRouteModel.fromJson(Map<String, dynamic> json) =>
      _$MountainRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainRouteModelToJson(this);
}
