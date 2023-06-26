import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

class Technique extends DataWithUUID {
  final String name;
  final String description;
  final String? image;
  final List<TechniqueOption> options;
  final List<String> links;

  Technique({
    required this.name,
    required this.description,
    this.image,
    super.id,
    List<TechniqueOption>? options,
    List<String>? links,
  })  : options = options ?? [],
        links = links ?? [];
}
