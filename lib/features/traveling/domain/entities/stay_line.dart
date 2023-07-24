import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day_line.dart';

class StayLine extends TravelDayLine {
  final StayType type;

  @override
  IconData? get icon => type.icon;

  StayLine({
    required this.type,
    required super.name,
    required super.description,
    required super.date,
    super.contacts,
  });
}

enum StayType { sleep, meal, shop, museum }

extension StayTypeExtension on StayType {
  String get description {
    switch (this) {
      case StayType.sleep:
        return 'Ночевка';
      case StayType.meal:
        return 'Питание';
      case StayType.shop:
        return 'Закупка';
      case StayType.museum:
        return 'Музей';
    }
  }

  IconData get icon {
    switch (this) {
      case StayType.sleep:
        return Icons.home;
      case StayType.meal:
        return Icons.restaurant;
      case StayType.shop:
        return Icons.shopping_basket;
      case StayType.museum:
        return Icons.museum;
    }
  }
}
