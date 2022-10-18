import 'package:climbing_diary/core/data/ascent_type.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';

class ClimbingHallAttempt {
  final ClimbingHallRoute route;
  final DateTime start;
  DateTime? finish;
  AscentType? ascentType;
  ClimbingHallAttempt({
    required this.route,
    required this.start,
    this.finish,
    this.ascentType,
  });
}
