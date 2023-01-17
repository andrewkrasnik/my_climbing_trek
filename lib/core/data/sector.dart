import 'package:climbing_diary/core/data/district.dart';

class Sector {
  final String name;
  final District district;
  final String image;

  Sector({
    required this.name,
    required this.district,
    this.image = '',
  });
}
