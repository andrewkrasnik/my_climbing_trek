class RouteColor {
  final String name;
  final String code;
  const RouteColor({
    required this.name,
    required this.code,
  });

  static const RouteColor red = RouteColor(name: 'Красный', code: 'FF0000');
  static const RouteColor yellow = RouteColor(name: 'Желтый', code: 'FF0000');
  static const RouteColor blue = RouteColor(name: 'Синий', code: 'FF0000');
  static const RouteColor green = RouteColor(name: 'Зеленый', code: 'FF0000');
}
