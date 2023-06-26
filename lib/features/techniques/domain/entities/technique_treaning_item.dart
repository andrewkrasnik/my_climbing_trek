import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

class TechniqueTreaningItem extends DataWithUUID {
  final Technique technique;
  final String comment;
  final List<TechniqueOption> options;

  TechniqueTreaningItem({
    required this.technique,
    this.comment = '',
    super.id,
    List<TechniqueOption>? options,
  }) : options = options ?? [];
}
