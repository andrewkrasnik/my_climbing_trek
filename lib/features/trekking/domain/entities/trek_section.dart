import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

class TrekSection {
  final TrekPoint start;
  final TrekPoint finish;
  final double length;
  final String description;

  TrekSection({
    required this.start,
    required this.finish,
    required this.length,
    this.description = '',
  });
}
