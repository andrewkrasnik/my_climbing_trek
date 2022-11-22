class AscentType {
  final String name;
  final int id;
  const AscentType._({
    required this.name,
    required this.id,
  });
  static const onsite = AscentType._(name: 'onsite', id: 1);
  static const redPoint = AscentType._(name: 'red point', id: 3);
  static const flash = AscentType._(name: 'flash', id: 3);

  static const List<AscentType> values = [onsite, redPoint, flash];

  @override
  String toString() => name;

  static AscentType getById(int id) =>
      values.firstWhere((element) => element.id == id);
}
