import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';

class MountainRoute extends DataWithUUID {
  final MountaineeringCategory category;
  final ClimbingCategory? climbingCategory;
  final AidCategory? aidCategory;
  final UssrClimbingCategory? ussrCategory;
  final MountainRouteType type;
  final List<MountainRouteRoop> roops;
  final String? image;
  final String name;
  final String description;
  final String passage;
  final String descent;

  MountainRoute({
    required this.category,
    required this.type,
    required this.roops,
    required this.name,
    super.id,
    this.image,
    this.descent = '',
    this.description = '',
    this.passage = '',
    this.aidCategory,
    this.climbingCategory,
    this.ussrCategory,
  });

  bool get isMultiPitch =>
      type == MountainRouteType.multiPitch ||
      type == MountainRouteType.tradMultiPitch;
}
