// ignore_for_file: non_constant_identifier_names

import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class MixedCategory extends DataWithUUID {
  final String name;
  final String description;

  MixedCategory({
    required this.name,
    required this.description,
    super.id,
  });

  static final M3 = MixedCategory(
    name: 'M3',
    description: 'Легко. Небольшой уклон, обычно инструменты не обязательны',
    id: 'M3',
  );

  static final M4 = MixedCategory(
    name: 'M4',
    description:
        'Рельеф от покатого до вертикального, требующий простой техники с инструментами',
    id: 'M4',
  );

  static final M5 = MixedCategory(
    name: 'M5',
    description: 'Напряженные продолжительные участки работы с инструментами',
    id: 'M5',
  );

  static final M6 = MixedCategory(
    name: 'M6',
    description:
        'Вертикальные и нависающие участки, требующие нетривиальной работы с инструментами',
    id: 'M6',
  );

  static final M7 = MixedCategory(
    name: 'M7',
    description:
        'Силовое и техническое лазание на нависаниях. Не более 10 метров сложного лазания',
    id: 'M7',
  );

  static final M8 = MixedCategory(
    name: 'M8',
    description:
        'Наличие практически горизонтальных нависаний (потолков), требующих силовых и техничных движений. Ключевые участки очень сложные и более длинные, чем на М7',
    id: 'M8',
  );

  static final M9 = MixedCategory(
    name: 'M9',
    description:
        'Продолжительные вертикальные или немного нависающие участки с мелкими, требующими высокой техники зацепками или потолки длиной в два–три роста человека с хорошими «ручками»',
    id: 'M9',
  );

  static final M10 = MixedCategory(
    name: 'M10',
    description:
        'Как минимум десятиметровые потолки или тридцатиметровые нависающие участки с силовыми движениями и без возможностей отдыха',
    id: 'M10',
  );

  static final M11 = MixedCategory(
    name: 'M11',
    description:
        'Полная веревка нависающего гимнастического лазанья или потолки до 15 метров длиной',
    id: 'M11',
  );

  static final M12 = MixedCategory(
    name: 'M12',
    description:
        'Как М11 с предельно сложными, динамическими движениями и нетривиальными зацепками, требующими тонкой техники',
    id: 'M12',
  );

  static final Map<String, MixedCategory> _values = {
    M3.id: M3,
    M4.id: M4,
    M5.id: M5,
    M6.id: M6,
    M8.id: M8,
    M9.id: M9,
    M10.id: M10,
    M11.id: M11,
    M12.id: M12,
  };

  static List<MixedCategory> get values => _values.values.toList();

  static MixedCategory getById(String id) => _values[id]!;
}
