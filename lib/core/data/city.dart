class City {
  final String name;
  final String id;
  const City({
    required this.name,
    required this.id,
  });

  static const City moscow = City(name: 'Москва', id: 'moscow');
  static const City spb = City(name: 'Санкт-Петербург', id: 'spb');

  static const List<City> values = [moscow, spb];

  static City getById(String id) =>
      values.firstWhere((element) => element.id == id);
}
