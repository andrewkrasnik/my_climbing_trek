import 'package:my_climbing_trek/core/data/climbing_route.dart';

class RockRoute extends ClimbingRoute {
  final String author;
  final int boltCount;
  final String anchor;
  final String name;
  final int? number;
  final int length;
  final String remark;

  RockRoute({
    required this.name,
    required super.category,
    required super.type,
    super.id,
    this.anchor = '',
    this.length = 0,
    this.boltCount = 0,
    this.number,
    this.remark = '',
    this.author = '',
  });
}
