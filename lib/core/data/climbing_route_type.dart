class ClimbingRouteType {
  final String name;
  const ClimbingRouteType({
    required this.name,
  });

  static const ClimbingRouteType bouldering =
      ClimbingRouteType(name: 'bouldering');
  static const ClimbingRouteType rope = ClimbingRouteType(name: 'rope');
}
