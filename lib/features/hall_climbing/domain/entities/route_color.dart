class RouteColor {
  final String name;
  final int code;
  const RouteColor({
    required this.name,
    required this.code,
  });

  static const RouteColor red = RouteColor(name: 'Красный', code: 0xFFF44336);
  static const RouteColor yellow = RouteColor(name: 'Желтый', code: 0xFFCDDC39);
  static const RouteColor blue = RouteColor(name: 'Синий', code: 0xFF2196F3);
  static const RouteColor green = RouteColor(name: 'Зеленый', code: 0xFF009688);
}
