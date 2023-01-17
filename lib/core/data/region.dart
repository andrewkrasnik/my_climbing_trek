import 'package:climbing_diary/core/data/district.dart';

class Region {
  final String name;
  final List<District> _districts;

  Region({
    required this.name,
    List<District>? districts,
  }) : _districts = districts ?? [];
}
