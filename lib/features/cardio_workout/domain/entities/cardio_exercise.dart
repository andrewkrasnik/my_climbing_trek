import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:flutter/material.dart';

class CardioExercise extends DataWithUUID {
  final String name;

  final IconData icon;
  final String lenghtUnit;
  CardioExercise(
      {required this.name,
      required this.icon,
      required this.lenghtUnit,
      super.id});

  static final CardioExercise jogging = CardioExercise(
      name: 'Пробежка', id: '1', icon: Icons.directions_run, lenghtUnit: 'км');
  static final CardioExercise swimming = CardioExercise(
      name: 'Плавание', id: '2', icon: Icons.pool, lenghtUnit: 'м');
  static final CardioExercise cycling = CardioExercise(
      name: 'Велосипед',
      id: '3',
      icon: Icons.directions_bike,
      lenghtUnit: 'км');
  static final CardioExercise crossCountrySkiing = CardioExercise(
      name: 'Беговые лыжи',
      id: '4',
      icon: Icons.downhill_skiing,
      lenghtUnit: 'км');

  static final List<CardioExercise> values = [
    jogging,
    swimming,
    cycling,
    crossCountrySkiing,
  ];

  static CardioExercise getById(String id) =>
      values.firstWhere((element) => element.id == id);

  String toJson() => id;

  factory CardioExercise.fromJson(json) => getById(json);
}
