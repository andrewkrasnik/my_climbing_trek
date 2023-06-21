import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TransportType extends DataWithUUID {
  final String name;
  final IconData icon;

  TransportType({required this.name, required this.icon, super.id});

  static final TransportType airplane =
      TransportType(name: 'Перелет', icon: Icons.flight, id: 'airplane');

  static final TransportType bus =
      TransportType(name: 'Автобус', icon: Icons.directions_bus, id: 'bus');

  static final TransportType taxi =
      TransportType(name: 'Такси', icon: Icons.local_taxi, id: 'taxi');

  static final TransportType car =
      TransportType(name: 'Автомобиль', icon: Icons.directions_car, id: 'car');

  static final TransportType train =
      TransportType(name: 'Поезд', icon: Icons.train, id: 'train');

  //  static final TransportType helicopter =
  //     TransportType(name: 'Вертолет', icon: Icons.helicopter, id: 'helicopter');

  static final TransportType boat =
      TransportType(name: 'По воде', icon: Icons.directions_boat, id: 'boat');

  static final Map<String, TransportType> _values = {
    airplane.id: airplane,
    bus.id: bus,
    taxi.id: taxi,
    car.id: car,
    train.id: train,
    boat.id: boat,
  };

  static List<TransportType> get values => _values.values.toList();

  static TransportType getById(String id) => _values[id]!;

  String toJson() => id;

  factory TransportType.fromJson(json) => getById(json);
}
