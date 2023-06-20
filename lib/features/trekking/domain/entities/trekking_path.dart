import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';

class TrekkingPath extends Treaning {
  final Region region;
  final Trek? trek;
  List<TrekkingPathEvent> events;
  final TrekkingType type;
  double length;
  int climbUp;
  int climbDown;
  TrekSection? currentSection;

  double get time {
    double pathTime = 0;
    if (events.isNotEmpty) {
      if (finished) {
        pathTime =
            events.last.time.difference(events.first.time).inMinutes / 60;
      } else {
        pathTime = DateTime.now().difference(events.first.time).inMinutes / 60;
      }
    }
    return pathTime;
  }

  bool visitPoint(TrekPoint point) {
    if (events.isNotEmpty && trek != null && currentSection != null) {
      final nextSection = trek!.nextSection(point);
      if (nextSection != null) {
        length += currentSection!.length;

        if (currentSection!.climbLength > 0) {
          climbUp += currentSection!.climbLength;
        } else {
          climbDown += -currentSection!.climbLength;
        }

        currentSection = nextSection;

        return true;
      }
    }

    return false;
  }

  List<TrekkingEventType> get actions =>
      events.lastOrNull?.type.actions ?? [TrekkingEventType.startMoving];

  TrekkingPath({
    required super.date,
    required this.region,
    required this.type,
    super.start,
    super.finish,
    super.id,
    this.trek,
    this.length = 0,
    this.climbDown = 0,
    this.climbUp = 0,
    List<TrekkingPathEvent>? events,
    this.currentSection,
  }) : events = events ?? [];

  @override
  void finishTreaning({DateTime? finish}) {
    currentSection = null;
    super.finishTreaning(finish: finish);
  }
}
