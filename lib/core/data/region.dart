import 'package:climbing_diary/core/data/data_with_uuid.dart';
import 'package:climbing_diary/core/data/district.dart';

class Region extends DataWithUUID {
  final String name;
  final List<District> _districts;

  Region({
    required this.name,
    List<District>? districts,
    super.id,
  }) : _districts = districts ?? [];
}
