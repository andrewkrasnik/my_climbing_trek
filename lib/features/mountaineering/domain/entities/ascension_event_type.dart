import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class AscensionEventType extends DataWithUUID {
  final String name;
  final int orderBy;

  AscensionEventType({
    required this.name,
    required this.orderBy,
    super.id,
  });

  static AscensionEventType start = AscensionEventType(
    name: 'Выход на подход',
    id: 'start',
    orderBy: 1,
  );

  static AscensionEventType onRoute = AscensionEventType(
    name: 'Начало маршрута',
    id: 'onRoute',
    orderBy: 2,
  );

  static AscensionEventType top = AscensionEventType(
    name: 'Вершина',
    id: 'top',
    orderBy: 3,
  );

  static AscensionEventType finish = AscensionEventType(
    name: 'Возвращение',
    id: 'finish',
    orderBy: 4,
  );

  static final Map<String, AscensionEventType> _values = {
    start.id: start,
    onRoute.id: onRoute,
    top.id: top,
    finish.id: finish,
    // brake.id: brake,
    // transport.id: transport,
    // end.id: end,
  };

  static final mainValues = [start, onRoute, top, finish];

  static List<AscensionEventType> get values => _values.values.toList();

  static AscensionEventType getById(String id) => _values[id]!;

  String toJson() => id;

  factory AscensionEventType.fromJson(json) => getById(json);
}
