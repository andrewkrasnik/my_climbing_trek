import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

class ClimbingHallTreaning {
  final DateTime date;
  final ClimbingHall climbingHall;
  List<ClimbingHallAttempt> attempts;
  ClimbingHallTreaning({
    required this.date,
    required this.climbingHall,
    required this.attempts,
  });
}
