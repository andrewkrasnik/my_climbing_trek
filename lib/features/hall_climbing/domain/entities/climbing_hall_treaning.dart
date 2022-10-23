import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

class ClimbingHallTreaning {
  final DateTime date;
  final ClimbingHall climbingHall;
  List<ClimbingHallAttempt> attempts;
  DateTime? _finish;

  bool get finished => _finish != null;

  ClimbingHallAttempt? get currentAttempt => attempts.last;

  ClimbingHallTreaning({
    required this.date,
    required this.climbingHall,
    required this.attempts,
  });
}
