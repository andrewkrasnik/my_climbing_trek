import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';

class Travel extends Treaning {
  final List<Region> regions;
  final String name;
  final String description;

  @override
  final String image;
  Travel({
    required super.date,
    required super.start,
    super.finish,
    required this.regions,
    required this.name,
    required this.image,
    this.description = '',
    super.id,
  });

  String get period => 'c 1 по 12 мая 2023';
}
