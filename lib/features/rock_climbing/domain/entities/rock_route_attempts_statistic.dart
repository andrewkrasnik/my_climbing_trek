import 'package:my_climbing_trek/core/data/ascent_type.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/route_status.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';

class RockRouteAttemptsStatistic {
  late final bool _done;
  late final DateTime? _doneDate;
  late final AscentType? _ascentType;
  final List<RockTreaningAttempt> _attempts;

  RockRouteAttemptsStatistic({
    required List<RockTreaningAttempt> attempts,
  }) : _attempts = attempts {
    bool done = false;
    DateTime? doneDate;
    AscentType? ascentType;

    for (final attempt in _attempts) {
      if (attempt.finished &&
          !attempt.fail &&
          attempt.style != ClimbingStyle.topRope) {
        done = true;
        doneDate = attempt.finishTime;
        ascentType = attempt.ascentType;
      }
    }

    _done = done;
    _doneDate = doneDate;
    _ascentType = ascentType;
  }

  int get count => _attempts.length;
  bool get done => _done;
  DateTime? get doneDate => _doneDate;
  AscentType? get ascentType => _ascentType;
  List<RockTreaningAttempt> get attempts => _attempts;

  String get routeTitle {
    if (done) {
      return '${ascentType ?? 'Первый пролаз'} ${doneDate!.dayString()} '
          '($count)';
    } else {
      return 'Проект, попыток: $count';
    }
  }

  RouteStatus get routeStatus {
    if (count == 0) {
      return RouteStatus.noAttempts;
    } else if (_done) {
      return RouteStatus.done;
    } else {
      return RouteStatus.progect;
    }
  }
}
