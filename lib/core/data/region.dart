import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class Region extends DataWithUUID {
  final String name;

  Region({
    required this.name,
    super.id,
  });

  static final moscow = Region(name: 'Москва и область', id: 'moscow');
  static final caucasus = Region(name: 'Северный кавказ', id: 'caucas');

  static final Map<String, Region> _values = {
    moscow.id: moscow,
    caucasus.id: caucasus
  };

  static List<Region> get values => _values.values.toList();

  static Region getById(String id) => _values[id]!;
}
