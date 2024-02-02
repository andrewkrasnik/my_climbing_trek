import 'package:my_climbing_trek/core/data/difficulty_category.dart';

class IceCategory extends DifficultyCategory {
  final String name;
  final String description;
  final int _order;
  @override
  final String id;

  const IceCategory({
    required this.name,
    required this.id,
    required int order,
    this.description = '',
  }) : _order = order;

  static const i1 = IceCategory(
    name: 'I1',
    description: 'Некрутой лед. Инструменты не требуются',
    order: 1,
    id: 'I1',
  );

  static const i2 = IceCategory(
    name: 'I2',
    description:
        'Общая крутизна в 60° с короткими и более крутыми ступенями. Страховка надежная',
    order: 2,
    id: 'I2',
  );

  static const i3 = IceCategory(
    name: 'I3',
    description:
        'Продолжительные участки 70° с длинными ступенями до 80°–90°. Достаточно мест для отдыха и удобной установки ледобуров',
    order: 3,
    id: 'I3',
  );

  static const i4 = IceCategory(
    name: 'I4',
    description:
        'Продолжительные участки 80°, достаточно длинные секции в 90° с изредка встречающимися местами для отдыха',
    order: 4,
    id: 'I4',
  );

  static const i4plus = IceCategory(
    name: 'I4+',
    description: 'highly technical I4',
    order: 5,
    id: 'I4plus',
  );

  static const i5 = IceCategory(
    name: 'I5',
    description:
        'Длинные и напряженные маршруты с крутизной в 85°–90° на всю веревку с малым количеством удобных позиций для отдыха, либо короткий участок тонкого или плохого льда, на котором трудно организовать страховку',
    order: 6,
    id: 'I5',
  );

  static const i5plus = IceCategory(
    name: 'I5+',
    description: 'highly technical I5',
    order: 7,
    id: 'I5plus',
  );

  static const i6 = IceCategory(
    name: 'I6',
    description:
        'Участок около 90° на всю длину веревки без мест для отдыха, либо более короткий участок, но еще более трудный, чем на WI5. Очень техничное лазание',
    order: 8,
    id: 'I6',
  );

  static const i6plus = IceCategory(
    name: 'I6+',
    description:
        'vertical or overhanging with no rests, and highly technical I6',
    order: 9,
    id: 'I6plus',
  );

  static const i7 = IceCategory(
    name: 'I7',
    description:
        'Трудность, как и в WI6, но на тонком, отслаивающемся льду или на длинных нависающих нестабильных сосульках. Страховка либо невозможна, либо очень проблематична и ненадежна',
    order: 10,
    id: 'I7',
  );

  static const List<IceCategory> values = [
    i1,
    i2,
    i3,
    i4,
    i4plus,
    i5,
    i5plus,
    i6,
    i6plus,
    i7,
  ];

  static final Map<String, IceCategory> _values = {
    for (final item in values) item.id: item
  };

  static IceCategory getById(String id) => _values[id]!;

  static List<IceCategory> byMaxCategory(IceCategory maxCategory) =>
      values.where((element) => element._order <= maxCategory._order).toList();
}
