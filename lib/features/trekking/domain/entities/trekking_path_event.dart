import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';

class TrekkingPathEvent extends DataWithUUID {
  final TrekkingEventType type;
  final TrekPoint? point;
  final DateTime time;
  final String pathId;

  TrekkingPathEvent({
    required this.pathId,
    required this.type,
    required this.time,
    this.point,
    super.id,
  });

  get isMooving => type == TrekkingEventType.startMoving;

  TrekkingPathEvent copyWith({
    TrekkingEventType? type,
    TrekPoint? point,
    DateTime? time,
    String? pathId,
  }) {
    return TrekkingPathEvent(
      type: type ?? this.type,
      point: point ?? this.point,
      time: time ?? this.time,
      pathId: pathId ?? this.pathId,
      id: id,
    );
  }
}
