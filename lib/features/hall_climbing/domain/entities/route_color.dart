import 'package:flutter/material.dart';

class RouteColor {
  final String name;
  final int code;
  final String id;

  MaterialColor get materialColor => MaterialColor(code, const {});

  const RouteColor({
    required this.name,
    required this.code,
    required this.id,
  });

  final color = Colors.amber;

  static const RouteColor red =
      RouteColor(name: 'Красный', code: 0xFFF40000, id: 'red');
  static const RouteColor yellow =
      RouteColor(name: 'Желтый', code: 0xFFCDDC39, id: 'yellow');
  static const RouteColor blue =
      RouteColor(name: 'Синий', code: 0xFF0000F3, id: 'blue');
  static const RouteColor green =
      RouteColor(name: 'Зеленый', code: 0xFF009900, id: 'green');
  static const RouteColor black =
      RouteColor(name: 'Черный', code: 0xFF000000, id: 'black');
  static const RouteColor orange =
      RouteColor(name: 'Оранжевый', code: 0xFFFF9800, id: 'orange');
  static const RouteColor white =
      RouteColor(name: 'Белый', code: 0xFFFFFFFF, id: 'white');
  static const RouteColor purple =
      RouteColor(name: 'Фиолетовый', code: 0xFF9C27B0, id: 'purple');
  static const RouteColor brown =
      RouteColor(name: 'Коричневый', code: 0xFF795548, id: 'brown');
  static const RouteColor sendy =
      RouteColor(name: 'Песочный', code: 0xFFFFC107, id: 'sendy');
  static const RouteColor pink =
      RouteColor(name: 'Розовый', code: 0xFFE91E63, id: 'pink');
  static const RouteColor lime =
      RouteColor(name: 'Светло-зеленый', code: 0xFF8BC34A, id: 'lime');
  static const RouteColor wave =
      RouteColor(name: 'Бирюзовый', code: 0xFF009688, id: 'wave');

  static const Map<String, RouteColor> _values = {
    'red': red,
    'yellow': yellow,
    'blue': blue,
    'green': green,
    'black': black,
    'orange': orange,
    'white': white,
    'purple': purple,
    'brown': brown,
    'sendy': sendy,
    'pink': pink,
    'lime': lime,
    'wave': wave,
  };

  static List<RouteColor> get values => _values.values.toList();

  static List<MaterialColor> get materialColors =>
      _values.values.map((e) => e.materialColor).toList();

  static Map<MaterialColor, RouteColor> get colorsMap {
    Map<MaterialColor, RouteColor> result = {};
    for (var color in values) {
      result[color.materialColor] = color;
    }
    return result;
  }

  static RouteColor getById(String id) => _values[id]!;
}
