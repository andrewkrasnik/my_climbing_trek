class ClimbingRouteType {
  final String name;
  final String id;

  const ClimbingRouteType({
    required this.name,
    required this.id,
  });

  static const ClimbingRouteType bouldering =
      ClimbingRouteType(name: 'bouldering', id: 'bouldering');
  static const ClimbingRouteType rope =
      ClimbingRouteType(name: 'rope', id: 'rope');
  static const ClimbingRouteType speed =
      ClimbingRouteType(name: 'speed', id: 'speed');
  static const ClimbingRouteType dryTooling =
      ClimbingRouteType(name: 'drytooling', id: 'dryTooling');

  static const List<ClimbingRouteType> values = [rope, bouldering, speed];

  static const List<ClimbingRouteType> rockValues = [
    rope,
    bouldering,
    dryTooling,
  ];

  static ClimbingRouteType getById(String id) =>
      values.firstWhere((element) => element.id == id);

  @override
  String toString() => name;
}
