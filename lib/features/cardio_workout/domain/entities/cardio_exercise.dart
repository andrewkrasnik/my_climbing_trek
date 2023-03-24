import 'package:flutter/material.dart';

class CardioExercise {
  final String name;
  final int id;
  final IconData icon;
  final String lenghtUnit;
  const CardioExercise({
    required this.name,
    required this.id,
    required this.icon,
    required this.lenghtUnit,
  });

  static const CardioExercise jogging = CardioExercise(
      name: 'Пробежка', id: 1, icon: Icons.directions_run, lenghtUnit: 'км');
  static const CardioExercise swimming = CardioExercise(
      name: 'Плавание', id: 2, icon: Icons.pool, lenghtUnit: 'м');
  static const CardioExercise cycling = CardioExercise(
      name: 'Велосипед', id: 2, icon: Icons.directions_bike, lenghtUnit: 'км');
  static const CardioExercise crossCountrySkiing = CardioExercise(
      name: 'Беговые лыжи',
      id: 2,
      icon: Icons.downhill_skiing,
      lenghtUnit: 'км');

  static const List<CardioExercise> values = [
    jogging,
    swimming,
    cycling,
    crossCountrySkiing,
  ];

  static CardioExercise getById(int id) =>
      values.firstWhere((element) => element.id == id);

  int toJson() => id;

  factory CardioExercise.fromJson(json) => getById(json);
}
