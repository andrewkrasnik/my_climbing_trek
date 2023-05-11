import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';

class ClimbingRoute extends DataWithUUID {
  final DifficultyCategory category;
  final ClimbingRouteType type;

  ClimbingRoute({
    required this.category,
    required this.type,
    super.id,
  });
}
