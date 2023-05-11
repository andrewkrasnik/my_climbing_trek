import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';

class Travel extends Treaning {
  final List<Region> regions;
  final String name;
  final String description;
  Travel({
    required super.date,
    required super.start,
    super.finish,
    required this.regions,
    this.name = '',
    this.description = '',
    super.id,
  });
}
