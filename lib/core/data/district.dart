import 'package:climbing_diary/core/data/region.dart';
import 'package:climbing_diary/core/data/sector.dart';

class District {
  final String name;
  final Region region;
  final List<Sector> _sectors;
  final String image;

  District({
    required this.name,
    required this.region,
    this.image = '',
    List<Sector>? sectors,
  }) : _sectors = sectors ?? [];
}
