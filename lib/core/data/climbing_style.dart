import 'package:climbing_diary/core/data/climbing_route_type.dart';

class ClimbingStyle {
  final String name;

  ClimbingRouteType get type => name == 'bouldering'
      ? ClimbingRouteType.bouldering
      : ClimbingRouteType.rope;
  const ClimbingStyle._({
    required this.name,
  });
  static const lead = ClimbingStyle._(name: 'lead');
  static const topRope = ClimbingStyle._(name: 'top rope');
  static const bouldering = ClimbingStyle._(name: 'bouldering');
  static const trad = ClimbingStyle._(name: 'trad');
  // static const solo = ClimbingStyle._(name: 'solo');
  // static const soloRope = ClimbingStyle._(name: 'solo rope');
  // static const ito = ClimbingStyle._(name: 'ito');
  // static const soloIto = ClimbingStyle._(name: 'solo ito');

  @override
  String toString() => name;
}
