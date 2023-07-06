import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event_type.dart';

class AscensionEvent {
  final AscensionEventType type;
  final DateTime time;
  final String ascentId;

  AscensionEvent({
    required this.type,
    required this.time,
    required this.ascentId,
  });
}
