import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';

class TechniqueTreaning extends Treaning {
  final Map<TechniqueGroup, List<TechniqueTreaningItem>> items;
  final String comment;

  TechniqueTreaning({
    Map<TechniqueGroup, List<TechniqueTreaningItem>>? items,
    required super.date,
    super.finish,
    super.id,
    super.start,
    this.comment = '',
  }) : items = items ?? {};
}
