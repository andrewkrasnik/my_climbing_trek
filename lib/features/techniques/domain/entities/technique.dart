import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class Technique extends DataWithUUID {
  final String name;
  final String description;
  final String? image;

  Technique({
    required this.name,
    required this.description,
    this.image,
    super.id,
  });
}
