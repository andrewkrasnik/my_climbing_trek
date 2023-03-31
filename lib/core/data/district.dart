import 'package:climbing_diary/core/data/data_with_uuid.dart';
import 'package:climbing_diary/core/data/region.dart';
import 'package:climbing_diary/core/data/sector.dart';

class District extends DataWithUUID {
  final String name;
  final Region region;
  final List<Sector> _sectors;
  final String image;

  District({
    required this.name,
    required this.region,
    this.image = '',
    List<Sector>? sectors,
    super.id,
  }) : _sectors = sectors ?? [];
}
