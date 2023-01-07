import 'package:climbing_diary/core/data/climbing_route_type.dart';

class ClimbingStyle {
  final String name;
  final int id;

  ClimbingRouteType get type => name == 'bouldering'
      ? ClimbingRouteType.bouldering
      : ClimbingRouteType.rope;
  const ClimbingStyle._({
    required this.name,
    required this.id,
  });
  static const lead = ClimbingStyle._(name: 'lead', id: 1);
  static const topRope = ClimbingStyle._(name: 'top rope', id: 2);
  static const bouldering = ClimbingStyle._(name: 'bouldering', id: 3);
  static const trad = ClimbingStyle._(name: 'trad', id: 4);
  static const autoBelay = ClimbingStyle._(name: 'autoBelay', id: 9);
  // static const solo = ClimbingStyle._(name: 'solo', id: 5);
  // static const soloRope = ClimbingStyle._(name: 'solo rope', id: 6);
  // static const ito = ClimbingStyle._(name: 'ito', id: 7);
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

  static ClimbingStyle getById(int id) =>
      values.firstWhere((element) => element.id == id);
}
