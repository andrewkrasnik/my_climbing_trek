import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TrekkingEventType extends DataWithUUID {
  final String name;

  TrekkingEventType({
    required this.name,
    super.id,
  });

  List<TrekkingEventType> get actions {
    if (this == startMoving) {
      return [meal, brake, photo, end, transport];
    } else {
      return [startMoving];
    }
  }

  static TrekkingEventType startMoving =
      TrekkingEventType(name: 'Старт', id: 'start');

  static TrekkingEventType overnightStay =
      TrekkingEventType(name: 'Остановка на ночь', id: 'overnightStay');

  static TrekkingEventType meal =
      TrekkingEventType(name: 'Прием пищи', id: 'meal');

  static TrekkingEventType brake =
      TrekkingEventType(name: 'Отдых', id: 'brake');

  static TrekkingEventType photo = TrekkingEventType(name: 'Фото', id: 'photo');

  static TrekkingEventType end =
      TrekkingEventType(name: 'Конец пути', id: 'end');

  static TrekkingEventType transport =
      TrekkingEventType(name: 'Смена транспорта', id: 'transport');

  static final Map<String, TrekkingEventType> _values = {
    startMoving.id: startMoving,
    overnightStay.id: overnightStay,
    photo.id: photo,
    meal.id: meal,
    brake.id: brake,
    transport.id: transport,
  };

  static List<TrekkingEventType> get values => _values.values.toList();

  static TrekkingEventType getById(String id) => _values[id]!;

  String toJson() => id;

  factory TrekkingEventType.fromJson(json) => getById(json);
}
