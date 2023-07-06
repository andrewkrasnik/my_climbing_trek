import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class AscensionEventType extends DataWithUUID {
  final String name;

  AscensionEventType({
    required this.name,
    super.id,
  });

  static AscensionEventType start =
      AscensionEventType(name: 'Выход на подход', id: 'start');

  static AscensionEventType onRoute =
      AscensionEventType(name: 'Начало маршрута', id: 'onRoute');

  static AscensionEventType top =
      AscensionEventType(name: 'Вершина', id: 'top');

  static AscensionEventType finish =
      AscensionEventType(name: 'Возвращение', id: 'finish');

  static final Map<String, AscensionEventType> _values = {
    start.id: start,
    onRoute.id: onRoute,
    top.id: top,
    finish.id: finish,
    // brake.id: brake,
    // transport.id: transport,
    // end.id: end,
  };

  static List<AscensionEventType> get values => _values.values.toList();

  static AscensionEventType getById(String id) => _values[id]!;

  String toJson() => id;

  factory AscensionEventType.fromJson(json) => getById(json);
}
