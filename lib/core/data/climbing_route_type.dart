class ClimbingRouteType {
  final String name;
  final int id;
  const ClimbingRouteType({
    required this.name,
    required this.id,
  });

  static const ClimbingRouteType bouldering =
      ClimbingRouteType(name: 'bouldering', id: 1);
  static const ClimbingRouteType rope = ClimbingRouteType(name: 'rope', id: 2);
  static const ClimbingRouteType speed =
      ClimbingRouteType(name: 'speed', id: 3);

  static const List<ClimbingRouteType> values = [bouldering, rope, speed];

  static ClimbingRouteType getById(int id) =>
      values.firstWhere((element) => element.id == id);
}
