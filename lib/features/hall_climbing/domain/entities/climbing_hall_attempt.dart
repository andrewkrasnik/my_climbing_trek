import 'package:climbing_diary/core/data/ascent_type.dart';
import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';

class ClimbingHallAttempt {
  final ClimbingHallRoute route;
  DateTime? _start;
  DateTime? _finish;
  AscentType? ascentType;
  final ClimbingStyle style;

  int get routeColor => route.color.code;
  ClimbingCategory get routeCategory => route.category;

  bool get planed => _start == null;
  bool get finished => _finish != null;

  ClimbingHallAttempt({
    required this.route,
    required this.style,
  });

  ClimbingHallAttempt copy() => ClimbingHallAttempt(route: route, style: style);

  void start() {
    _start = DateTime.now();
  }

  void finish() {
    _finish = DateTime.now();
  }
}
