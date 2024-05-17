// ignore_for_file: non_constant_identifier_names

import 'package:my_climbing_trek/core/data/difficulty_category.dart';

class UssrClimbingCategory extends DifficultyCategory {
  @override
  final String id;
  final String name;
  final String description;

  UssrClimbingCategory({
    required this.name,
    required this.description,
    required this.id,
  });
  static final UssrClimbingCategory NC = UssrClimbingCategory(
    name: 'Б/К',
    description: 'Пешком',
    id: 'NC',
  );

  static final UssrClimbingCategory I = UssrClimbingCategory(
    name: 'I',
    description:
        'Легкие скалы. Для движения и сохранения равновесия иногда требуется помощь рук. Многочисленные, в основном крупные зацепы на сильно расчлененном рельефе',
    id: 'I',
  );

  static final UssrClimbingCategory II = UssrClimbingCategory(
    name: 'II',
    description:
        'Скалы средней трудности. Сохранение равновесия и передвижение невозможно без помощи рук. Для опытных альпинистов возможно одновременное движение связки на короткой веревке',
    id: 'II',
  );

  static final UssrClimbingCategory III = UssrClimbingCategory(
    name: 'III',
    description:
        'Довольно трудные скалы. Зацепки относительно невелики и далеко друг от друга. Одновременное движение невозможно, только с попеременной страховкой. Однозначно потребуются петли, закладки, карабины и прочее «железо»',
    id: 'III',
  );

  static final UssrClimbingCategory IIIplus = UssrClimbingCategory(
    name: 'III+',
    description:
        'Довольно трудные скалы. Зацепки относительно невелики и далеко друг от друга. Одновременное движение невозможно, только с попеременной страховкой. Однозначно потребуются петли, закладки, карабины и прочее «железо»',
    id: 'IIIplus',
  );

  static final UssrClimbingCategory IV = UssrClimbingCategory(
    name: 'IV',
    description:
        'Очень трудные скалы. Спортивное свободное лазание по крутым скалам. Попеременная и промежуточная страховка с помощью крючьев и других вспомогательных средств.',
    id: 'IV',
  );

  static final UssrClimbingCategory IVplus = UssrClimbingCategory(
    name: 'IV+',
    description:
        'Очень трудные скалы. Спортивное свободное лазание по крутым скалам. Попеременная и промежуточная страховка с помощью крючьев и других вспомогательных средств.',
    id: 'IVplus',
  );

  static final UssrClimbingCategory V = UssrClimbingCategory(
    name: 'V',
    description:
        'Особо трудные скалы. Тут уже требуется весьма высокая техническая и физическая подготовка. Часто возможности страховки скудны (соответственно, автоматически повышаются требования к скалолазному мастерству). Возможно использование искусственных точек опоры.',
    id: 'V',
  );

  static final UssrClimbingCategory Vplus = UssrClimbingCategory(
    name: 'V+',
    description:
        'Особо трудные скалы. Тут уже требуется весьма высокая техническая и физическая подготовка. Часто возможности страховки скудны (соответственно, автоматически повышаются требования к скалолазному мастерству). Возможно использование искусственных точек опоры.',
    id: 'Vplus',
  );

  static final UssrClimbingCategory VI = UssrClimbingCategory(
    name: 'VI',
    description: 'сверхсложные скалы',
    id: 'VI',
  );

  static final Map<String, UssrClimbingCategory> _values = {
    NC.id: NC,
    I.id: I,
    II.id: II,
    III.id: III,
    IIIplus.id: IIIplus,
    IV.id: IV,
    IVplus.id: IVplus,
    V.id: V,
    Vplus.id: Vplus,
    VI.id: VI,
  };

  static List<UssrClimbingCategory> get values => _values.values.toList();

  static UssrClimbingCategory getById(String id) => _values[id]!;
}
