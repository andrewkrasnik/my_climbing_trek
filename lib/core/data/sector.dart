import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/district.dart';

class Sector extends DataWithUUID {
  final String name;
  final String image;

  Sector({
    required this.name,
    this.image = '',
    super.id,
  });
}
