import 'package:climbing_diary/core/data/climbing_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/route_color.dart';

class ClimbingHallRoute extends ClimbingRoute {
  final ClimbingHall climbingHall;
  final RouteColor color;
  final int sectorNumber;
  final bool arhive;
  const ClimbingHallRoute({
    required this.climbingHall,
    required super.category,
    required this.color,
    required super.type,
    this.sectorNumber = 0,
    this.arhive = false,
  });
}
