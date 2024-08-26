import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';

class Ascension extends Treaning {
  final Mountain mountain;
  final MountainRoute route;
  final List<AscensionEvent> events;

  @override
  bool get hasEditing => true;

  Ascension({
    required super.date,
    required this.mountain,
    required this.route,
    super.finish,
    super.id,
    super.start,
    List<AscensionEvent>? events,
  }) : events = events ?? [];

  @override
  String get image => mountain.image;

  @override
  String get title => '${mountain.name}, ${route.name}';
}
