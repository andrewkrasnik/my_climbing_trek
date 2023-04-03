import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class ClimbingRoute extends DataWithUUID {
  final ClimbingCategory category;
  final ClimbingRouteType type;

  ClimbingRoute({
    required this.category,
    required this.type,
    super.id,
  });
}
