class MountaineeringCategory {
  final String id;
  final String russianName;
  final String frenchName;
  final String uiaaName;

  const MountaineeringCategory({
    required this.id,
    required this.russianName,
    required this.frenchName,
    required this.uiaaName,
  });

  static const oneB = MountaineeringCategory(
      id: 'oneB', russianName: '1Б', frenchName: 'F', uiaaName: 'I');

  static const twoA = MountaineeringCategory(
      id: 'twoA', russianName: '2А', frenchName: 'PD', uiaaName: 'II');

  static const twoB = MountaineeringCategory(
      id: 'twoB', russianName: '2Б', frenchName: 'PD+', uiaaName: 'II/III');

  static const treeA = MountaineeringCategory(
      id: 'treeA', russianName: '3А', frenchName: 'AD', uiaaName: 'III');

  static const treeB = MountaineeringCategory(
      id: 'treeB', russianName: '3Б', frenchName: 'AD+', uiaaName: 'III/IV');

  static const fourA = MountaineeringCategory(
      id: 'fourA', russianName: '4А', frenchName: 'D', uiaaName: 'IV');

  static const fourB = MountaineeringCategory(
      id: 'fourB', russianName: '4Б', frenchName: 'D+', uiaaName: 'IV/V');

  static const fiveA = MountaineeringCategory(
      id: 'fiveA', russianName: '5А', frenchName: 'TD/ED', uiaaName: 'V');

  static const fiveB = MountaineeringCategory(
      id: 'fiveB', russianName: '5Б', frenchName: 'TD+/ED', uiaaName: 'V/VI');

  static const sixA = MountaineeringCategory(
      id: 'sixA', russianName: '6А', frenchName: 'ED/ED+', uiaaName: 'VI');

  static const sixB = MountaineeringCategory(
      id: 'sixB', russianName: '6Б', frenchName: 'ED3', uiaaName: 'VII');

  static const Map<String, MountaineeringCategory> _values = {
    'oneB': oneB,
    'twoA': twoA,
    'twoB': twoB,
    'treeA': treeA,
    'treeB': treeB,
    'fourA': fourA,
    'fourB': fourB,
    'fiveA': fiveA,
    'fiveB': fiveB,
    'sixA': sixA,
    'sixB': sixB,
  };

  static List<MountaineeringCategory> get values => _values.values.toList();

  static MountaineeringCategory getById(String id) => _values[id]!;
}
