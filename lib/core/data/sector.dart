import 'package:climbing_diary/core/data/data_with_uuid.dart';
import 'package:climbing_diary/core/data/district.dart';

class Sector extends DataWithUUID {
  final String name;
  final District district;
  final String image;

  Sector({
    required this.name,
    required this.district,
    this.image = '',
    super.id,
  });
}
