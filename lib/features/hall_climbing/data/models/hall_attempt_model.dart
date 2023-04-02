import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

class HallAttemptModel extends ClimbingHallAttempt {
  HallAttemptModel({
    required super.category,
    required super.style,
    super.route,
  });
}
