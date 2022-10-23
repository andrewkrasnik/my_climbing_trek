class City {
  final String name;
  const City({
    required this.name,
  });

  static const City moscow = City(name: 'Москва');
  static const City spb = City(name: 'Санкт-Петербург');
}
