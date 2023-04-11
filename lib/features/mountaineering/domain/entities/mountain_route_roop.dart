import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';

class MountainRouteRoop extends DataWithUUID {
  final ClimbingCategory? climbingCategory;
  final IceCategory? iceCategory;
  final int length;
  final int boltCount;
  final String anchor;
  final int slope;

  MountainRouteRoop({
    this.climbingCategory,
    this.iceCategory,
    required this.length,
    required this.slope,
    this.anchor = '',
    this.boltCount = 0,
  });
}
