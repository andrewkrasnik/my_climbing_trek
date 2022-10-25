import 'package:climbing_diary/core/data/ascent_type.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';

class ClimbingHallAttempt {
  final ClimbingHallRoute route;
  final DateTime start;
  DateTime? finish;
  AscentType? ascentType;
  final ClimbingStyle style;

  int get routeColor => route.color.code;
  String get routeCategory => route.category.name;

  ClimbingHallAttempt({
    required this.route,
    required this.start,
    required this.style,
    this.finish,
    this.ascentType,
  });

  ClimbingHallAttempt copy() =>
      ClimbingHallAttempt(route: route, start: DateTime.now(), style: style);
}
