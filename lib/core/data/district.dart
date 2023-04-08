import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/region.dart';

class District extends DataWithUUID {
  final String name;
  final Region region;
  final String image;

  District({
    required this.name,
    required this.region,
    this.image = '',
    super.id,
  });
}
