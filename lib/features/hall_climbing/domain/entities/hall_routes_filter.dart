import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_route_type.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';

class HallRouteFilter {
  final ClimbingCategory? category;
  final ClimbingRouteType? type;
  final bool? autoBelay;
  final bool active;
  HallRouteFilter({
    this.category,
    this.type,
    this.autoBelay,
    this.active = true,
  });

  HallRouteFilter copyWith({
    ClimbingCategory? category,
    ClimbingRouteType? type,
  }) {
    return HallRouteFilter(
      category: category ?? this.category,
      type: type ?? this.type,
    );
  }

  bool match(ClimbingHallRoute route) {
    if (active && route.archive) {
      return false;
    }
    if (type != null && route.type != type) {
      return false;
    }
    if ((autoBelay == true && !route.autoBelay) ||
        (autoBelay == false && route.autoBelay)) {
      return false;
    }
    if (category != null && route.category != category) {
      return false;
    }
    return true;
  }
}
