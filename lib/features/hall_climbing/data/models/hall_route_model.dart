import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/route_color.dart';

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

  Map<String, dynamic> toJson() => {
        'category': category.id,
        'color': color.id,
        'type': type.id,
        'sectorNumber': sectorNumber,
        'archive': archive,
        'autoBelay': autoBelay,
        'id': id,
      };

  factory HallRouteModel.fromOrign(ClimbingHallRoute route) => HallRouteModel(
        category: route.category,
        color: route.color,
        type: route.type,
        archive: route.archive,
        id: route.id,
        sectorNumber: route.sectorNumber,
        autoBelay: route.autoBelay,
      );

  factory HallRouteModel.fromJson(Map<String, dynamic> json, {String? id}) =>
      HallRouteModel(
        category: ClimbingCategory.getById(json['category']),
        color: RouteColor.getById(json['color']),
        type: ClimbingRouteType.getById(json['type']),
        sectorNumber: json['sectorNumber'],
        archive: json['archive'] ?? false,
        autoBelay: json['autoBelay'] ?? false,
        id: id ?? json['id'],
      );
}
