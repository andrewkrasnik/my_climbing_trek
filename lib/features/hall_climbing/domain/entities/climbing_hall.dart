import 'package:climbing_diary/core/data/map_point.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';

class ClimbingHall {
  final String name;
  final String address;
  final City city;
  final bool hasBouldering;
  final bool hasBigWall;
  final MapPoint point;
  final String image;
  final String telephone;
  final String website;

  ClimbingHall({
    required this.name,
    required this.address,
    required this.city,
    required this.hasBouldering,
    required this.hasBigWall,
    required this.point,
    required this.image,
    required this.telephone,
    required this.website,
  });
}
