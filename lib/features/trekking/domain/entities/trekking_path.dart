import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';

class TrekkingPath extends Treaning {
  final Region region;
  final Trek? trek;
  List<TrekkingPathEvent> events;
  final TrekkingType type;
  double length;
  TrekSection? currentSection;

  TrekkingPath({
    required super.date,
    required this.region,
    required this.type,
    super.start,
    super.finish,
    super.id,
    this.trek,
    this.length = 0,
    List<TrekkingPathEvent>? events,
    this.currentSection,
  }) : events = events ?? [];
}
