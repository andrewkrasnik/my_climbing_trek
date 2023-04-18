// ignore_for_file: non_constant_identifier_names

import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class AidCategory extends DataWithUUID {
  final String name;
  final String description;

  AidCategory({
    required this.name,
    required this.description,
    super.id,
  });

  static final A1 = AidCategory(
    name: 'A1',
    description: 'Простое ИТО. Все точки абсолютно надежны',
    id: 'A1',
  );

  static final A2 = AidCategory(
    name: 'A2',
    description:
        'ИТО средней сложности. Надежные точки, но их не так просто установить',
    id: 'A2',
  );

  static final A2plus = AidCategory(
    name: 'A2+',
    description:
        'Десятиметровое падение возможно с ненадежных точек, но без риска для жизни',
    id: 'A2plus',
  );
  static final A3 = AidCategory(
    name: 'A3',
    description:
        'Непростое ИТО. Много ненадежных точек подряд. Возможность срыва на 15 метров. Прохождение веревки может занимать несколько часов',
    id: 'A3',
  );

  static final A3plus = AidCategory(
    name: 'A3+',
    description: 'Как АЗ, но падение может вести к серьезным последствиям',
    id: 'A3plus',
  );

  static final A4 = AidCategory(
    name: 'A4',
    description:
        'Сложное ИТО. Возможен срыв на 30 метров с падением на полку. Продолжительные участки ненадежных точек',
    id: 'A4',
  );

  static final A4plus = AidCategory(
    name: 'A4+',
    description:
        'Очень сложное ИТО с еще большим риском срыва. Каждая веревка требует многочасовой работы',
    id: 'A4plus',
  );

  static final A5 = AidCategory(
    name: 'A5',
    description:
        'Экстремально сложное ИТО. Ни одна точка на всей длине веревки не может удержать срыв',
    id: 'A5',
  );

  static final A6 = AidCategory(
    name: 'A6',
    description:
        'Лазание уровня А5, но станции тоже не держат срыва. Срыв одного ведет к падению всех',
    id: 'A6',
  );

  static final Map<String, AidCategory> _values = {
    A1.id: A1,
    A2.id: A2,
    A2plus.id: A2plus,
    A3.id: A3,
    A3plus.id: A3plus,
    A4.id: A4,
    A4plus.id: A4plus,
    A5.id: A5,
    A6.id: A6,
  };

  static List<AidCategory> get values => _values.values.toList();

  static AidCategory getById(String id) => _values[id]!;
}
