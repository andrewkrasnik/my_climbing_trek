class AscentType {
  final String name;
  final String id;
  const AscentType._({
    required this.name,
    required this.id,
  });
  static const onsite = AscentType._(name: 'onsite', id: 'onsite');
  static const redPoint = AscentType._(name: 'red point', id: 'redPoint');
  static const flash = AscentType._(name: 'flash', id: 'flash');

  static List<AscentType> get values => _values.values.toList();

  static const Map<String, AscentType> _values = {
    'onsite': onsite,
    'redPoint': redPoint,
    'flash': flash,
  };

  @override
  String toString() => name;

  static AscentType getById(String id) => _values[id]!;
}
