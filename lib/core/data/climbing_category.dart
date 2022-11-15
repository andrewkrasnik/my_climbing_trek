class ClimbingCategory {
  final String french;
  final String usa;
  final String uiaa;
  final String britane;
  final String sacson;
  final String nord;
  final String ewbank;
  final String brasilian;
  final int id;

  String get name => french;

  const ClimbingCategory({
    required this.french,
    required this.usa,
    required this.uiaa,
    required this.britane,
    required this.sacson,
    required this.nord,
    required this.ewbank,
    required this.brasilian,
    required this.id,
  });

  static ClimbingCategory getById(int id) =>
      values.firstWhere((element) => element.id == id);

  static const ClimbingCategory category5A = ClimbingCategory(
      id: 1,
      french: '5A',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category5B = ClimbingCategory(
      id: 2,
      french: '5B',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category5C = ClimbingCategory(
      id: 3,
      french: '5C',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category6A = ClimbingCategory(
      id: 4,
      french: '6A',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category6B = ClimbingCategory(
      id: 5,
      french: '6B',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category6C = ClimbingCategory(
      id: 6,
      french: '6C',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category7A = ClimbingCategory(
      id: 7,
      french: '7A',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category7B = ClimbingCategory(
      id: 8,
      french: '7B',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const ClimbingCategory category7C = ClimbingCategory(
      id: 9,
      french: '7C',
      usa: '',
      uiaa: '',
      britane: '',
      sacson: '',
      nord: '',
      ewbank: '',
      brasilian: '');

  static const List<ClimbingCategory> values = [
    category5A,
    category5B,
    category5C,
    category6A,
    category6B,
    category6C,
    category7A,
    category7B,
    category7C,
  ];
}
