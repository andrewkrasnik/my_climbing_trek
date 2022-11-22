import 'package:climbing_diary/core/data/climbing_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/route_color.dart';

class ClimbingHallRoute extends ClimbingRoute {
  final int id;

  final RouteColor color;
  final int sectorNumber;
  final bool arhive;
  const ClimbingHallRoute({
    required super.category,
    required this.color,
    required super.type,
    this.sectorNumber = 0,
    this.arhive = false,
    this.id = 0,
  });
}
