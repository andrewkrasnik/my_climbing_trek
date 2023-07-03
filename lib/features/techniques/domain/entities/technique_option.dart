import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TechniqueOption extends DataWithUUID {
  final String name;
  final String? description;

  TechniqueOption({
    required this.name,
    this.description,
    super.id,
  });
}
