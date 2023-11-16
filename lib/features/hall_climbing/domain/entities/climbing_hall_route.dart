import 'package:my_climbing_trek/core/data/climbing_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/route_color.dart';

class ClimbingHallRoute extends ClimbingRoute {
  final RouteColor color;
  final int sectorNumber;
  bool archive;
  final bool autoBelay;
  final String description;
  final String name;
  final String author;
  final DateTime? createDate;
  ClimbingHallRoute({
    required super.category,
    required this.color,
    required super.type,
    this.sectorNumber = 0,
    this.autoBelay = false,
    this.archive = false,
    this.author = '',
    this.name = '',
    this.description = '',
    this.createDate,
    super.id,
  });
}
