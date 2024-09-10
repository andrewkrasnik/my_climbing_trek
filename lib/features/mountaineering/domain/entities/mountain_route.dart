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
  final List<String> _links;
  final String author;
  final String firstAscentYear;
  final int length;
  final String? ueaaSchemaImage;
  final String? farLink;

  List<String> get links => _links;

  static ClimbingCategory? maxClimbingCategory(List<MountainRouteRoop> roops) {
    final tempCategories = roops
        .where((item) => item.climbingCategory != null)
        .map((item) => item.climbingCategory!)
        .toList();

    tempCategories.sort(
      (a, b) => a.id.compareTo(b.id),
    );

    return tempCategories.lastOrNull;
  }

  MountainRoute(
      {required this.category,
      required this.type,
      required this.roops,
      required this.name,
      super.id,
      this.image,
      this.descent = '',
      this.description = '',
      this.firstAscentYear = '',
      this.author = '',
      this.passage = '',
      this.length = 0,
      this.aidCategory,
      this.climbingCategory,
      this.ussrCategory,
      this.ueaaSchemaImage,
      this.farLink,
      List<String>? links})
      : _links = links ?? [];

  bool get isMultiPitch =>
      type == MountainRouteType.multiPitch ||
      type == MountainRouteType.tradMultiPitch;
}
