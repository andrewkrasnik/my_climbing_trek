class City {
  final String name;
  final int id;
  const City({
    required this.name,
    required this.id,
  });

  static const City moscow = City(name: 'Москва', id: 1);
  static const City spb = City(name: 'Санкт-Петербург', id: 2);

  static const List<City> values = [moscow, spb];

  static City getById(int id) =>
      values.firstWhere((element) => element.id == id);

  int toJson() => id;

  factory City.fromJson(json) => getById(json);
}
