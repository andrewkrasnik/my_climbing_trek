import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hall_route_model.g.dart';

@JsonSerializable(converters: [
  ClimbingCategoryConverter(),
  ClimbingRouteTypeConverter(),
  RouteColorConverter(),
])
class HallRouteModel extends ClimbingHallRoute {
  HallRouteModel({
    required super.category,
    required super.color,
    required super.type,
    super.sectorNumber,
    super.archive,
    super.autoBelay,
    super.id,
  });

  factory HallRouteModel.fromOrign(ClimbingHallRoute route) => HallRouteModel(
        category: route.category,
        color: route.color,
        type: route.type,
        archive: route.archive,
        id: route.id,
        sectorNumber: route.sectorNumber,
        autoBelay: route.autoBelay,
      );

  factory HallRouteModel.fromJson(Map<String, dynamic> json) =>
      _$HallRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$HallRouteModelToJson(this);
}
