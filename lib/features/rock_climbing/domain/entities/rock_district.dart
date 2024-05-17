import 'package:my_climbing_trek/core/data/district.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';

class RockDistrict extends District {
  final bool compact;
  final MapPoint? mapPoint;

  RockDistrict({
    this.compact = false,
    required super.name,
    required super.region,
    this.mapPoint,
    super.image,
    super.id,
    super.hasEditPermission,
  });
}
