import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';

class TrekkingPathEvent {
  final TrekkingPath path;
  final TrekkingEventType type;
  final TrekPoint? point;
  final DateTime time;

  TrekkingPathEvent({
    required this.path,
    required this.type,
    required this.time,
    this.point,
  });
}
