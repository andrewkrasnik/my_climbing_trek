import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class Region extends DataWithUUID {
  final String name;
  final String? image;
  final String state;
  final bool hasEditPermission;

  Region({
    required this.name,
    super.id,
    this.image,
    required this.state,
    this.hasEditPermission = false,
    super.localData,
  });

  static final moscow =
      Region(name: 'Москва и область', id: 'moscow', state: 'Россия');
  static final caucasus =
      Region(name: 'Северный кавказ', id: 'caucasus', state: 'Россия');
  static final vladimirskaya = Region(
      name: 'Владимирская область', id: 'vladimirskaya', state: 'Россия');

  static final Map<String, Region> _values = {
    moscow.id: moscow,
    caucasus.id: caucasus,
    vladimirskaya.id: vladimirskaya,
  };

  static List<Region> get values => _values.values.toList();

  String get cacheKey => 'mountainsRegion$id';

  get trekCacheKey => 'trekkingRegion$id';

  static Region getById(String id) => _values[id]!;
}
