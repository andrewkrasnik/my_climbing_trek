import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class CostType extends DataWithUUID {
  final String name;
  CostType({
    required this.name,
    super.id,
  });

  static final CostType transport =
      CostType(name: 'Транспорт', id: 'transport');

  static final CostType food = CostType(name: 'Питание', id: 'food');

  static final CostType stay = CostType(name: 'Проживание', id: 'stay');

  static final CostType organization =
      CostType(name: 'Организационные взносы', id: 'organization');

  static final CostType equpmentRent =
      CostType(name: 'Аренда снаряжения', id: 'equpmentRent');

  static final CostType insurance =
      CostType(name: 'Страхование', id: 'insurance');

  static final CostType others = CostType(name: 'Прочие расходы', id: 'others');

  static final CostType currencyExchange =
      CostType(name: 'Обмен валюты', id: 'currencyExchange');

  static final Map<String, CostType> _values = {
    transport.id: transport,
    food.id: food,
    stay.id: stay,
    organization.id: organization,
    equpmentRent.id: equpmentRent,
    insurance.id: insurance,
    others.id: others,
    currencyExchange.id: currencyExchange,
  };

  static List<CostType> get values => _values.values.toList();

  static CostType getById(String id) => _values[id]!;

  @override
  String toString() => name;
}
