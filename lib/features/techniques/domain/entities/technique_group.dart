import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TechniqueGroup extends DataWithUUID {
  final String name;
  final String description;
  final String image;

  TechniqueGroup({
    required this.name,
    required this.description,
    required this.image,
    super.id,
  });
}
