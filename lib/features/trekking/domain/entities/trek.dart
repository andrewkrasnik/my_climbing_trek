import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';

class Trek extends DataWithUUID {
  final String name;
  final List<TrekSection> sections;
  final Region region;
  final String? image;
  final String? mapImage;
  final List<String> links;

  TrekPoint get start => sections.first.start;

  TrekPoint get finish => sections.last.finish;

  Trek({
    required this.name,
    required this.sections,
    required this.region,
    this.image,
    this.mapImage,
    super.id,
    List<String>? links,
  }) : links = links ?? [];

  String get imageUrl => image ?? finish.image!;
}
