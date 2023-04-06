import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:flutter/material.dart';

class CardioExercise extends DataWithUUID {
  final String name;

  final IconData icon;
  final String lengthUnit;
  CardioExercise(
      {required this.name,
      required this.icon,
      required this.lengthUnit,
      super.id});

  static final CardioExercise jogging = CardioExercise(
      name: 'Пробежка', id: '1', icon: Icons.directions_run, lengthUnit: 'км');
  static final CardioExercise swimming = CardioExercise(
      name: 'Плавание', id: '2', icon: Icons.pool, lengthUnit: 'м');
  static final CardioExercise cycling = CardioExercise(
      name: 'Велосипед',
      id: '3',
      icon: Icons.directions_bike,
      lengthUnit: 'км');
  static final CardioExercise crossCountrySkiing = CardioExercise(
      name: 'Беговые лыжи',
      id: '4',
      icon: Icons.downhill_skiing,
      lengthUnit: 'км');

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
