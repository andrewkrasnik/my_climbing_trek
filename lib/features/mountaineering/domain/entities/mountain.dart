import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/region.dart';

class Mountain extends DataWithUUID {
  final Region region;
  final String name;
  final int altitude;
  final String image;

  Mountain({
    required this.region,
    required this.name,
    required this.altitude,
    required this.image,
    super.id,
  });
}
