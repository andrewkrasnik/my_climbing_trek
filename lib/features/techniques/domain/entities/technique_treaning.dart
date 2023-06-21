import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

class TechniqueTreaning extends Treaning {
  final TechniqueGroup group;

  TechniqueTreaning({
    required this.group,
    required super.date,
    super.finish,
    super.id,
    super.start,
  });
}
