import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

class GymRouteAttemptsStatistic {
  late final bool _done;
  late final DateTime? _doneDate;
  final List<ClimbingHallAttempt> _attempts;

  GymRouteAttemptsStatistic({
    required List<ClimbingHallAttempt> attempts,
  }) : _attempts = attempts {
    bool done = false;
    DateTime? doneDate;

    for (final attempt in _attempts) {
      if (attempt.finished &&
          !attempt.fail &&
          attempt.style != ClimbingStyle.topRope) {
        done = true;
        doneDate = attempt.finishTime;
      }
    }

    _done = done;
    _doneDate = doneDate;
  }

  int get count => _attempts.length;
  bool get done => _done;
  DateTime? get doneDate => _doneDate;
  List<ClimbingHallAttempt> get attempts => _attempts;
}
