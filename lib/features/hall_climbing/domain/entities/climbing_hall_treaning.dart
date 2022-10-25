import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

class ClimbingHallTreaning {
  final DateTime date;
  final ClimbingHall climbingHall;
  List<ClimbingHallAttempt> attempts;
  DateTime? _finish;

  bool get finished => _finish != null;

  bool get hasLead => leadAttempts.isNotEmpty;

  List<ClimbingHallAttempt> get leadAttempts =>
      attempts.where((element) => element.style == ClimbingStyle.lead).toList();

  bool get hasTopRope => topRopeAttempts.isNotEmpty;

  List<ClimbingHallAttempt> get topRopeAttempts => attempts
      .where((element) => element.style == ClimbingStyle.topRope)
      .toList();

  bool get hasBouldering => boulderingAttempts.isNotEmpty;

  List<ClimbingHallAttempt> get boulderingAttempts => attempts
      .where((element) => element.style == ClimbingStyle.bouldering)
      .toList();

  ClimbingHallAttempt? get currentAttempt => attempts.last;

  ClimbingHallTreaning({
    required this.date,
    required this.climbingHall,
    required this.attempts,
  });

  ClimbingHallTreaning copy() => ClimbingHallTreaning(
      date: DateTime.now(), climbingHall: climbingHall, attempts: attempts);

  void finish() {
    _finish = DateTime.now();
  }
}
