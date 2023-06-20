import 'package:collection/collection.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';

class Trek extends DataWithUUID {
  final String name;
  final List<TrekSection> sections;
  final Region region;
  final String? image;
  final String? mapImage;
  final List<String> links;
  final TrekkingType type;

  TrekPoint get start => sections.first.start;

  TrekPoint get finish => sections.last.finish;

  TrekSection? nextSection(TrekPoint point) =>
      sections.firstWhereOrNull((element) => element.start == point);

  Trek({
    required this.name,
    required this.sections,
    required this.region,
    required this.type,
    this.image,
    this.mapImage,
    super.id,
    List<String>? links,
  }) : links = links ?? [];

  String get imageUrl => image ?? finish.image!;
}
