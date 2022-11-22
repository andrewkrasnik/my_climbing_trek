import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_route_type.dart';

class ClimbingRoute {
  final ClimbingCategory category;
  final ClimbingRouteType type;

  const ClimbingRoute({
    required this.category,
    required this.type,
  });
}
