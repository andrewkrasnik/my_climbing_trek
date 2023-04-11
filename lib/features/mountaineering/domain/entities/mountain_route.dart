import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';

class MountainRoute extends DataWithUUID {
  final MountaineeringCategory category;
  final MountainRouteType type;
  final List<MountainRouteRoop> roops;
  final String? image;
  final String name;

  MountainRoute({
    required this.category,
    required this.type,
    required this.roops,
    required this.name,
    super.id,
    this.image,
  });
}
