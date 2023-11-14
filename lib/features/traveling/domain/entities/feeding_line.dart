import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';

class FeedingLine {
  final Meal meal;
  final FeedingType type;
  final List<ContactLine> contacts;

  FeedingLine({
    required this.meal,
    required this.type,
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];
}

enum Meal { breakfast, lunch, dinner }

extension MealExtension on Meal {
  String get description {
    switch (this) {
      case Meal.breakfast:
        return 'Завтрак';
      case Meal.lunch:
        return 'Обед';
      case Meal.dinner:
        return 'Ужин';
    }
  }
}

enum FeedingType {
  none,
  catering,
  baseCampCooking,
  campCooking,
  snacks,
  organization,
}

extension FeedingTypeExtension on FeedingType {
  String get description {
    switch (this) {
      case FeedingType.none:
        return 'Нет';
      case FeedingType.catering:
        return 'Общепит';
      case FeedingType.baseCampCooking:
        return 'Готовка в лагере';
      case FeedingType.campCooking:
        return 'Готовка на выходе';
      case FeedingType.snacks:
        return 'Перекус';
      case FeedingType.organization:
        return 'Организатор';
    }
  }
}
