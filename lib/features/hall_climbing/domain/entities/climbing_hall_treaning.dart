import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class ClimbingHallTreaning {
  int? id;
  final DateTime date;
  final ClimbingHall climbingHall;
  List<ClimbingHallAttempt> attempts;
  DateTime? _finish;

  DateTime? get getFinish => _finish;

  bool get finished => _finish != null;

  bool get hasLead => leadAttempts.isNotEmpty;

  ClimbingHallAttempt? get currentAttempt =>
      attempts.firstWhereOrNull((element) => element.started);
  ClimbingHallAttempt? get lastAttempt =>
      attempts.firstWhereOrNull((element) => element.finished);

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

  ClimbingHallTreaning({
    required this.date,
    required this.climbingHall,
    required this.attempts,
    this.id,
  });

  bool get isNew => id == null;

  String get dateString => DateFormat('dd.MM.yyyy').format(date);

  String get title => '${climbingHall.name} $dateString';

  ClimbingHallTreaning copy() => ClimbingHallTreaning(
        date: DateTime.now(),
        climbingHall: climbingHall,
        attempts: attempts.map((e) => e.copy()).toList(),
      );

  void finish() {
    _finish = DateTime.now();
  }
}
