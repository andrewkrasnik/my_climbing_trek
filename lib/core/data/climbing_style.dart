import 'package:my_climbing_trek/core/data/climbing_route_type.dart';

class ClimbingStyle {
  final String name;
  final String id;

  ClimbingRouteType get type => name == 'bouldering'
      ? ClimbingRouteType.bouldering
      : ClimbingRouteType.rope;
  const ClimbingStyle._({
    required this.name,
    required this.id,
  });
  static const lead = ClimbingStyle._(name: 'lead', id: 'lead');
  static const topRope = ClimbingStyle._(name: 'top rope', id: 'top_rope');
  static const bouldering =
      ClimbingStyle._(name: 'bouldering', id: 'bouldering');
  static const trad = ClimbingStyle._(name: 'trad', id: 'trad');
  static const autoBelay = ClimbingStyle._(name: 'autoBelay', id: 'autoBelay');
  // static const solo = ClimbingStyle._(name: 'solo', id: 5);
  // static const soloRope = ClimbingStyle._(name: 'solo rope', id: 6);
  static const ito = ClimbingStyle._(name: 'aid', id: 'aid');
  // static const soloIto = ClimbingStyle._(name: 'solo ito', id: 8);
  static const List<ClimbingStyle> values = [
    lead,
    topRope,
    bouldering,
    trad,
    autoBelay,
  ];
  @override
  String toString() => name;

  static ClimbingStyle getById(String id) =>
      values.firstWhere((element) => element.id == id);
}
