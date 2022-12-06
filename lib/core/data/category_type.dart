class CategoryType {
  final String name;
  final int id;
  const CategoryType._({
    required this.name,
    required this.id,
  });

  static CategoryType getById(int id) =>
      values.firstWhere((element) => element.id == id);

  static const CategoryType french = CategoryType._(name: 'Французская', id: 1);
  static const CategoryType usa = CategoryType._(name: 'США', id: 2);
  static const CategoryType uiaa = CategoryType._(name: 'UIAA', id: 3);
  static const CategoryType britane = CategoryType._(name: 'Британская', id: 4);
  static const CategoryType sacson = CategoryType._(name: 'Саксонская', id: 5);
  static const CategoryType nord = CategoryType._(name: 'Нордическая', id: 6);
  static const CategoryType ewbank = CategoryType._(name: 'Ewbank', id: 7);
  static const CategoryType brasilian =
      CategoryType._(name: 'Бразильская', id: 8);

  static const List<CategoryType> values = [
    french,
    usa,
    uiaa,
    britane,
    sacson,
    nord,
    ewbank,
    brasilian,
  ];
}
