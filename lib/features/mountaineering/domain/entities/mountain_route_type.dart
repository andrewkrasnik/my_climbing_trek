class MountainRouteType {
  final String id;
  final String name;
  const MountainRouteType({
    required this.id,
    required this.name,
  });

  static const rock = MountainRouteType(id: 'rock', name: 'Скальный');

  static const ice = MountainRouteType(id: 'ice', name: 'Ледовый');

  static const snow = MountainRouteType(id: 'snow', name: 'Снежный');

  static const multiPitch =
      MountainRouteType(id: 'multiPitch', name: 'Мультипитч');

  static const combine =
      MountainRouteType(id: 'combine', name: 'Комбинированный');

  static const _values = {
    'rock': rock,
    'ice': ice,
    'snow': snow,
    'combine': combine,
    'multiPitch': multiPitch,
  };

  static List<MountainRouteType> get values => _values.values.toList();

  static MountainRouteType getById(String id) => _values[id]!;
}
