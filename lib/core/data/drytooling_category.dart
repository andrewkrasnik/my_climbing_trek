// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/category_type.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';

class DrytoolingCategory extends DifficultyCategory {
  final String name;
  final String description;
  @override
  final String id;

  DrytoolingCategory({
    required this.name,
    required this.description,
    required this.id,
  });

  @override
  MaterialColor get color => Colors.teal;

  @override
  double fontSize(String title) {
    if (name.length > 2) {
      return 20;
    } else {
      return 24;
    }
  }

  @override
  String title(CategoryType hallCategoryType) => name;

  static final D3 = DrytoolingCategory(
    name: 'D3',
    description: 'Легко. Небольшой уклон, обычно инструменты не обязательны',
    id: 'D3',
  );

  static final D4 = DrytoolingCategory(
    name: 'D4',
    description:
        'Рельеф от покатого до вертикального, требующий простой техники с инструментами',
    id: 'D4',
  );

  static final D5 = DrytoolingCategory(
    name: 'D5',
    description: 'Напряженные продолжительные участки работы с инструментами',
    id: 'D5',
  );

  static final D6 = DrytoolingCategory(
    name: 'D6',
    description:
        'Вертикальные и нависающие участки, требующие нетривиальной работы с инструментами',
    id: 'D6',
  );

  static final D7 = DrytoolingCategory(
    name: 'D7',
    description:
        'Силовое и техническое лазание на нависаниях. Не более 10 метров сложного лазания',
    id: 'D7',
  );

  static final D8 = DrytoolingCategory(
    name: 'D8',
    description:
        'Наличие практически горизонтальных нависаний (потолков), требующих силовых и техничных движений. Ключевые участки очень сложные и более длинные, чем на М7',
    id: 'D8',
  );

  static final D9 = DrytoolingCategory(
    name: 'D9',
    description:
        'Продолжительные вертикальные или немного нависающие участки с мелкими, требующими высокой техники зацепками или потолки длиной в два–три роста человека с хорошими «ручками»',
    id: 'D9',
  );

  static final D10 = DrytoolingCategory(
    name: 'D10',
    description:
        'Как минимум десятиметровые потолки или тридцатиметровые нависающие участки с силовыми движениями и без возможностей отдыха',
    id: 'D10',
  );

  static final D11 = DrytoolingCategory(
    name: 'D11',
    description:
        'Полная веревка нависающего гимнастического лазанья или потолки до 15 метров длиной',
    id: 'D11',
  );

  static final D12 = DrytoolingCategory(
    name: 'D12',
    description:
        'Как D11 с предельно сложными, динамическими движениями и нетривиальными зацепками, требующими тонкой техники',
    id: 'D12',
  );

  static final D13 = DrytoolingCategory(
    name: 'D13',
    description:
        'Как D12 с предельно сложными, динамическими движениями и нетривиальными зацепками, требующими тонкой техники',
    id: 'D13',
  );

  static final Map<String, DrytoolingCategory> _values = {
    D3.id: D3,
    D4.id: D4,
    D5.id: D5,
    D6.id: D6,
    D7.id: D7,
    D8.id: D8,
    D9.id: D9,
    D10.id: D10,
    D11.id: D11,
    D12.id: D12,
    D13.id: D13,
  };

  static List<DrytoolingCategory> get values => _values.values.toList();

  static List<DrytoolingCategory> get hallValues => [
        D3,
        D4,
        D5,
        D6,
        D7,
        D8,
        D9,
        D10,
      ];

  static DrytoolingCategory getById(String id) => _values[id]!;
}
