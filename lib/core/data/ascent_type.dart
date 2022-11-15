class AscentType {
  final String name;
  const AscentType._({
    required this.name,
  });
  static const onsite = AscentType._(name: 'onsite');
  static const redPoint = AscentType._(name: 'red point');
  static const flash = AscentType._(name: 'flash');

  @override
  String toString() => name;
}
