import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event_type.dart';

class AscensionEvent extends DataWithUUID {
  final AscensionEventType type;
  DateTime? time;
  DateTime? planedTime;
  final String ascentId;

  bool get showInWidget => AscensionEventType.mainValues.contains(type);

  AscensionEvent({
    required this.type,
    required this.ascentId,
    this.time,
    this.planedTime,
    super.id,
  });
}
