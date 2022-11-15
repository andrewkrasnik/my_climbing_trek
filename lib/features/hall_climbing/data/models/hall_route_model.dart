import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_route_type.dart';
import 'package:climbing_diary/features/hall_climbing/data/models/hall_model.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/route_color.dart';

class HallRouteModel extends ClimbingHallRoute {
  HallRouteModel({
    required super.category,
    required super.color,
    required super.type,
    super.sectorNumber,
    super.arhive,
    super.id,
  });

  Map<String, dynamic> toJson() => {
        'category': category.id,
        'color': color.id,
        'type': type.id,
        'sectorNumber': sectorNumber,
        'arhive': arhive,
        'id': id,
      };

  factory HallRouteModel.fromOrign(ClimbingHallRoute route) => HallRouteModel(
        category: route.category,
        color: route.color,
        type: route.type,
        arhive: route.arhive,
        id: route.id,
        sectorNumber: route.sectorNumber,
      );

  factory HallRouteModel.fromJson(Map<String, dynamic> json) => HallRouteModel(
        category: ClimbingCategory.getById(json['category']),
        color: RouteColor.getById(json['color']),
        type: ClimbingRouteType.getById(json['type']),
        sectorNumber: json['sectorNumber'],
        arhive: json['arhive'],
        id: json['id'],
      );
}
