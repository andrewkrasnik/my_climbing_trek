import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TrekPointType extends DataWithUUID {
  final String name;

  TrekPointType({
    required this.name,
    super.id,
  });

  static TrekPointType pass = TrekPointType(name: 'Перевал', id: 'pass');

  static TrekPointType camp = TrekPointType(name: 'Ночевка', id: 'camp');

  static TrekPointType populatedLocality =
      TrekPointType(name: 'Населенный пункт', id: 'populatedLocality');

  static TrekPointType referencePoint =
      TrekPointType(name: 'Ориентир', id: 'referencePoint');

  static TrekPointType waterfall =
      TrekPointType(name: 'Водопад', id: 'waterfall');

  static final Map<String, TrekPointType> _values = {
    pass.id: pass,
    camp.id: camp,
    populatedLocality.id: populatedLocality,
    referencePoint.id: referencePoint,
    waterfall.id: waterfall,
  };

  static List<TrekPointType> get values => _values.values.toList();

  static TrekPointType getById(String id) => _values[id]!;

  String toJson() => id;

  factory TrekPointType.fromJson(json) => getById(json);
}
