class Currency {
  final String name;
  final int code;

  Currency({
    required this.name,
    required this.code,
  });

  static final Currency rub = Currency(name: 'RUB', code: 643);

  static final Currency usd = Currency(name: 'USD', code: 840);

  static final Currency euro = Currency(name: 'EUR', code: 978);

  static final Currency kgs = Currency(name: 'KGS', code: 417);

  static final Currency npr = Currency(name: 'NPR', code: 524);

  static final Currency kzt = Currency(name: 'KZT', code: 398);

  static final Map<int, Currency> _values = {
    rub.code: rub,
    usd.code: usd,
    euro.code: euro,
    kgs.code: kgs,
    npr.code: npr,
    kzt.code: kzt,
  };

  static List<Currency> get values => _values.values.toList();

  static Currency getById(String id) => _values[id]!;
}
