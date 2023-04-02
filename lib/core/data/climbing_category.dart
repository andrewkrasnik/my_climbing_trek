// https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%82%D0%B5%D0%B3%D0%BE%D1%80%D0%B8%D1%8F_%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8_(%D1%81%D0%BA%D0%B0%D0%BB%D0%BE%D0%BB%D0%B0%D0%B7%D0%B0%D0%BD%D0%B8%D0%B5)#UIAA

import 'package:my_climbing_trek/core/data/category_type.dart';

class ClimbingCategory {
  final String french;
  final String usa;
  final String uiaa;
  final String britane;
  final String sacson;
  final String nord;
  final String ewbank;
  final String brasilian;
  final int id;

  String get name => french;

  const ClimbingCategory({
    required this.french,
    required this.usa,
    required this.uiaa,
    required this.britane,
    required this.sacson,
    required this.nord,
    required this.ewbank,
    required this.brasilian,
    required this.id,
  });

  String title(CategoryType type) {
    switch (type) {
      case CategoryType.french:
        return french;
      case CategoryType.usa:
        return usa;
      case CategoryType.uiaa:
        return uiaa;
      case CategoryType.britane:
        return britane;
      case CategoryType.sacson:
        return sacson;
      case CategoryType.nord:
        return nord;
      case CategoryType.ewbank:
        return ewbank;
      case CategoryType.brasilian:
        return brasilian;
      default:
        return french;
    }
  }

  static ClimbingCategory getById(int id) =>
      values.firstWhere((element) => element.id == id);

  static const ClimbingCategory category1 = ClimbingCategory(
      id: 19,
      french: '1',
      usa: '3-4',
      uiaa: 'I',
      britane: '1M',
      sacson: 'I',
      nord: '1',
      ewbank: '1-4',
      brasilian: 'I');

  static const ClimbingCategory category2 = ClimbingCategory(
      id: 20,
      french: '2',
      usa: '5.1',
      uiaa: 'II',
      britane: '2D',
      sacson: 'II',
      nord: '2',
      ewbank: '5-8',
      brasilian: 'II');

  static const ClimbingCategory category3 = ClimbingCategory(
      id: 21,
      french: '3',
      usa: '5.3',
      uiaa: 'III',
      britane: '3',
      sacson: 'III',
      nord: '3',
      ewbank: '8-9',
      brasilian: 'II sup');

  static const ClimbingCategory category4A = ClimbingCategory(
      id: 22,
      french: '4A',
      usa: '5.4',
      uiaa: 'iV',
      britane: '3VD',
      sacson: 'IV',
      nord: '4',
      ewbank: '10-11',
      brasilian: 'III');

  static const ClimbingCategory category4B = ClimbingCategory(
      id: 23,
      french: '4B',
      usa: '5.5',
      uiaa: 'IV+',
      britane: '4aS',
      sacson: 'V',
      nord: '4',
      ewbank: '11-12',
      brasilian: 'III sup');

  static const ClimbingCategory category4C = ClimbingCategory(
      id: 24,
      french: '4C',
      usa: '5.6',
      uiaa: 'V',
      britane: '4bHS',
      sacson: 'VI',
      nord: '5-',
      ewbank: '13',
      brasilian: 'IV');

  static const ClimbingCategory category5A = ClimbingCategory(
      id: 1,
      french: '5A',
      usa: '5.7',
      uiaa: 'V+',
      britane: '4cVS',
      sacson: 'VI',
      nord: '5-',
      ewbank: '14-15',
      brasilian: 'IV');

  static const ClimbingCategory category5B = ClimbingCategory(
      id: 2,
      french: '5B',
      usa: '5.8',
      uiaa: 'VI-',
      britane: '4cHVS',
      sacson: 'VIIa',
      nord: '5',
      ewbank: '16',
      brasilian: 'IV sup');

  static const ClimbingCategory category5C = ClimbingCategory(
      id: 3,
      french: '5C',
      usa: '5.9',
      uiaa: 'VI',
      britane: '5a',
      sacson: 'VIIb',
      nord: '5+',
      ewbank: '17',
      brasilian: 'V');

  static const ClimbingCategory category6A = ClimbingCategory(
      id: 4,
      french: '6A',
      usa: '5.10a',
      uiaa: 'VI+',
      britane: '5aE1',
      sacson: 'VIIc',
      nord: '6-',
      ewbank: '18',
      brasilian: 'VI sup');

  static const ClimbingCategory category6Aplus = ClimbingCategory(
      id: 13,
      french: '6A+',
      usa: '5.10b',
      uiaa: 'VII-',
      britane: '5b',
      sacson: 'VIIc',
      nord: '6-',
      ewbank: '19',
      brasilian: 'VI');

  static const ClimbingCategory category6B = ClimbingCategory(
      id: 5,
      french: '6B',
      usa: '5.10c',
      uiaa: 'VII',
      britane: '5bE2',
      sacson: 'VIIIa',
      nord: '6',
      ewbank: '20',
      brasilian: 'VI sup');

  static const ClimbingCategory category6Bplus = ClimbingCategory(
      id: 14,
      french: '6B+',
      usa: '5.10d',
      uiaa: 'VII+',
      britane: '5c',
      sacson: 'VIIIb',
      nord: '6',
      ewbank: '20',
      brasilian: 'VI sup');

  static const ClimbingCategory category6C = ClimbingCategory(
      id: 6,
      french: '6C',
      usa: '5.11b',
      uiaa: 'VIII-',
      britane: '5cE3',
      sacson: 'VIIIc',
      nord: '6+',
      ewbank: '21',
      brasilian: '7a');

  static const ClimbingCategory category6Cplus = ClimbingCategory(
      id: 15,
      french: '6C+',
      usa: '5.11c',
      uiaa: 'VIII-',
      britane: '6a',
      sacson: 'iXa',
      nord: '7-',
      ewbank: '23',
      brasilian: '7b');

  static const ClimbingCategory category7A = ClimbingCategory(
      id: 7,
      french: '7A',
      usa: '5.11d',
      uiaa: 'VIII',
      britane: '6aE4',
      sacson: 'IXb',
      nord: '7',
      ewbank: '24',
      brasilian: '7c');

  static const ClimbingCategory category7Aplus = ClimbingCategory(
      id: 16,
      french: '7A+',
      usa: '5.12a',
      uiaa: 'VIII+',
      britane: '6aE5',
      sacson: 'IXc',
      nord: '7+',
      ewbank: '25',
      brasilian: '8a');

  static const ClimbingCategory category7B = ClimbingCategory(
      id: 8,
      french: '7B',
      usa: '5.12b',
      uiaa: 'VIII+',
      britane: '6aE5',
      sacson: 'IXc',
      nord: '8-',
      ewbank: '26',
      brasilian: '8b');

  static const ClimbingCategory category7Bplus = ClimbingCategory(
      id: 17,
      french: '7B+',
      usa: '5.12c',
      uiaa: 'IX-',
      britane: '6bE6',
      sacson: 'Xa',
      nord: '8',
      ewbank: '27',
      brasilian: '8c');

  static const ClimbingCategory category7C = ClimbingCategory(
      id: 9,
      french: '7C',
      usa: '5.12c',
      uiaa: 'IX',
      britane: '6bE6',
      sacson: 'Xb',
      nord: '8+',
      ewbank: '28',
      brasilian: '9a');

  static const ClimbingCategory category7Cplus = ClimbingCategory(
      id: 18,
      french: '7C+',
      usa: '5.13a',
      uiaa: 'IX+',
      britane: '6bE7',
      sacson: 'Xc',
      nord: '8+',
      ewbank: '29',
      brasilian: '9b');

  static const ClimbingCategory category8A = ClimbingCategory(
      id: 25,
      french: '8A',
      usa: '5.13b',
      uiaa: 'IX+',
      britane: '6c',
      sacson: 'Xc',
      nord: '9',
      ewbank: '29',
      brasilian: '9c');

  static const ClimbingCategory category8Aplus = ClimbingCategory(
      id: 28,
      french: '8A+',
      usa: '5.13c',
      uiaa: 'X-',
      britane: '6cE8',
      sacson: 'XIa',
      nord: '9+',
      ewbank: '30',
      brasilian: '10a');

  static const ClimbingCategory category8B = ClimbingCategory(
      id: 26,
      french: '8B',
      usa: '5.13d',
      uiaa: 'X',
      britane: '7a',
      sacson: 'XIb',
      nord: '10-',
      ewbank: '31',
      brasilian: '10b');

  static const ClimbingCategory category8Bplus = ClimbingCategory(
      id: 29,
      french: '8B+',
      usa: '5.14a',
      uiaa: 'X+',
      britane: '7aE10',
      sacson: 'XIc',
      nord: '10',
      ewbank: '32',
      brasilian: '10c');

  static const ClimbingCategory category8C = ClimbingCategory(
      id: 27,
      french: '8C',
      usa: '5.14b',
      uiaa: 'X+',
      britane: '7aE10',
      sacson: 'XIc',
      nord: '10+',
      ewbank: '33',
      brasilian: '11a');

  static const ClimbingCategory category8Cplus = ClimbingCategory(
      id: 30,
      french: '8C+',
      usa: '5.14c',
      uiaa: 'XI-',
      britane: '7bE11',
      sacson: 'XIc',
      nord: '11-',
      ewbank: '34',
      brasilian: '11b');

  static const ClimbingCategory category9A = ClimbingCategory(
      id: 31,
      french: '9A',
      usa: '5.14d',
      uiaa: 'XI',
      britane: '7bE11',
      sacson: 'XIc',
      nord: '11',
      ewbank: '35',
      brasilian: '11c');

  static const ClimbingCategory category9Aplus = ClimbingCategory(
      id: 34,
      french: '9A+',
      usa: '5.15a',
      uiaa: 'XI+',
      britane: '7bE11',
      sacson: 'XIc',
      nord: '11',
      ewbank: '36',
      brasilian: '12a');

  static const ClimbingCategory category9B = ClimbingCategory(
      id: 32,
      french: '9B',
      usa: '5.15b',
      uiaa: 'XII-',
      britane: '7bE11',
      sacson: 'XIc',
      nord: '11',
      ewbank: '37',
      brasilian: '12b');

  static const ClimbingCategory category9Bplus = ClimbingCategory(
      id: 35,
      french: '9B+',
      usa: '5.15c',
      uiaa: 'XII-',
      britane: '7bE11',
      sacson: 'XIc',
      nord: '11',
      ewbank: '38',
      brasilian: '12c');

  static const ClimbingCategory category9C = ClimbingCategory(
      id: 33,
      french: '9C',
      usa: '5.15c',
      uiaa: 'XII',
      britane: '7bE11',
      sacson: 'XIc',
      nord: '11',
      ewbank: '39',
      brasilian: '13');

  static const List<ClimbingCategory> values = [
    category1,
    category2,
    category3,
    category4A,
    category4B,
    category4C,
    category5A,
    category5B,
    category5C,
    category6A,
    category6Aplus,
    category6B,
    category6Bplus,
    category6C,
    category6Cplus,
    category7A,
    category7Aplus,
    category7B,
    category7Bplus,
    category7C,
    category7Cplus,
    category8A,
    category8Aplus,
    category8B,
    category8Bplus,
    category8C,
    category8Cplus,
    category9A,
    category9Aplus,
    category9B,
    category9Bplus,
    category9C,
  ];

  static const List<ClimbingCategory> hallValues = [
    category5B,
    category5C,
    category6A,
    category6Aplus,
    category6B,
    category6Bplus,
    category6C,
    category6Cplus,
    category7A,
    category7Aplus,
    category7B,
    category7Bplus,
    category7C,
    category7Cplus,
    category8A,
    category8Aplus,
    category8B,
  ];

  double fontSize(String title) {
    double fontSize = 24;
    if (title.length > 4) {
      fontSize = 14;
    } else if (title.length > 3) {
      fontSize = 16;
    } else if (title.length > 2) {
      fontSize = 20;
    }

    return fontSize;
  }
}
