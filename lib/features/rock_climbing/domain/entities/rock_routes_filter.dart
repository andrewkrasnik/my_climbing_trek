import 'package:equatable/equatable.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/route_status.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';

class RockRouteFilter extends Equatable {
  final ClimbingCategory? category;
  final ClimbingRouteType? type;
  final RouteStatus? routeStatus;

  const RockRouteFilter({
    this.category,
    this.type,
    this.routeStatus,
  });

  RockRouteFilter copyWith({
    ClimbingCategory? category,
    ClimbingRouteType? type,
    RouteStatus? routeStatus,
  }) {
    return RockRouteFilter(
      category: category ?? this.category,
      type: type ?? this.type,
      routeStatus: routeStatus ?? this.routeStatus,
    );
  }

  bool match(RockRoute route, {RockRouteAttemptsStatistic? statistic}) {
    if (type != null && route.type != type) {
      return false;
    }

    if (category != null && route.category != category) {
      return false;
    }

    if (routeStatus != null &&
        statistic != null &&
        statistic.routeStatus != routeStatus) {
      return false;
    }

    return true;
  }

  @override
  List<Object?> get props => [category, type];
}
