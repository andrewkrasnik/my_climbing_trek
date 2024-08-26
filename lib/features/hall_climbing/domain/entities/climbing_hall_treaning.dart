import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:collection/collection.dart';

class ClimbingHallTreaning extends Treaning {
  final ClimbingHall climbingHall;
  List<ClimbingHallAttempt> attempts;

  bool get hasLead => leadAttempts.isNotEmpty;

  @override
  bool get hasEditing => true;

  ClimbingHallAttempt? get currentAttempt =>
      attempts.firstWhereOrNull((element) => element.started);
  ClimbingHallAttempt? get lastAttempt =>
      attempts.lastWhereOrNull((element) => element.finished);

  List<ClimbingHallAttempt> get leadAttempts =>
      attempts.where((element) => element.style == ClimbingStyle.lead).toList();

  bool get hasTopRope => topRopeAttempts.isNotEmpty;

  List<ClimbingHallAttempt> get topRopeAttempts => attempts
      .where((element) => element.style == ClimbingStyle.topRope)
      .toList();

  bool get hasBouldering => boulderingAttempts.isNotEmpty;

  bool get hasAutoBelay => autoBelayAttempts.isNotEmpty;

  List<ClimbingHallAttempt> get boulderingAttempts => attempts
      .where((element) => element.style == ClimbingStyle.bouldering)
      .toList();

  List<ClimbingHallAttempt> get autoBelayAttempts => attempts
      .where((element) => element.style == ClimbingStyle.autoBelay)
      .toList();

  ClimbingHallTreaning({
    required super.date,
    required this.climbingHall,
    required this.attempts,
    super.finish,
    super.start,
    super.id,
  });

  @override
  String get title => '${climbingHall.name} $dateString';

  @override
  String get place => climbingHall.name;

  @override
  String get image => climbingHall.image;

  ClimbingHallTreaning copy() => ClimbingHallTreaning(
        date: DateTime.now(),
        climbingHall: climbingHall,
        attempts: attempts.map((e) => e.copy()).toList(),
      );
}
