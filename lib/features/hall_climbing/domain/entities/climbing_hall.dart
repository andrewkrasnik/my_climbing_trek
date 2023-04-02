import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/city.dart';

class ClimbingHall {
  final String name;
  final String address;
  final City city;
  final bool hasBouldering;
  final bool hasBigWall;
  final bool hasSpeed;
  final bool hasAutoBelay;
  final MapPoint point;
  final String image;
  final String telephone;
  final String website;
  final String email;
  final int id;

  String get fullAddress => '${city.name}, $address';

  List<ClimbingStyle> get styles => [
        if (hasBouldering) ClimbingStyle.bouldering,
        if (hasBigWall) ...[
          ClimbingStyle.lead,
          ClimbingStyle.topRope,
        ],
      ];

  const ClimbingHall({
    required this.name,
    required this.address,
    required this.city,
    this.hasBouldering = false,
    this.hasBigWall = false,
    this.hasAutoBelay = false,
    required this.point,
    required this.image,
    required this.telephone,
    required this.website,
    required this.email,
    this.hasSpeed = false,
    this.id = 0,
  });
}
