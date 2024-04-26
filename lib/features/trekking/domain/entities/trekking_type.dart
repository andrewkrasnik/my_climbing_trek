import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TrekkingType extends DataWithUUID {
  final String name;

  TrekkingType({
    required this.name,
    super.id,
  });

  static TrekkingType walking = TrekkingType(name: 'Пеший', id: 'walking');

  static TrekkingType bicycling =
      TrekkingType(name: 'Велосипедный', id: 'bicycle');

  static TrekkingType horseRiding =
      TrekkingType(name: 'Конный', id: 'horseRiding');

  static TrekkingType skiing = TrekkingType(name: 'Лыжный', id: 'skiing');

  static final Map<String, TrekkingType> _values = {
    walking.id: walking,
    horseRiding.id: horseRiding,
    bicycling.id: bicycling,
    skiing.id: skiing,
  };

  static List<TrekkingType> get values => _values.values.toList();

  static TrekkingType getById(String id) => _values[id]!;

  String toJson() => id;

  factory TrekkingType.fromJson(json) => getById(json);

  @override
  String toString() => name;
}
