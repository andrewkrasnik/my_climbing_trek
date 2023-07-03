import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';

class TechniqueTreaning extends Treaning {
  final List<TechniqueTreaningItem> _items;

  final String comment;

  List<TechniqueTreaningItem> get items => _items;

  Map<TechniqueGroup, List<TechniqueTreaningItem>> get itemsMap {
    final Map<TechniqueGroup, List<TechniqueTreaningItem>> map = {};

    for (var item in _items) {
      if (map.containsKey(item.group)) {
        map[item.group]!.add(item);
      } else {
        map[item.group] = [item];
      }
    }

    return map;
  }

  TechniqueTreaning({
    List<TechniqueTreaningItem>? items,
    required super.date,
    super.finish,
    super.id,
    super.start,
    this.comment = '',
  }) : _items = items ?? [];
}
