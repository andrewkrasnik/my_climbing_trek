import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/place_filter.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';

class TravelFilter extends PlaceFilter {
  final IceDistrict? iceDistrict;
  final RockDistrict? rockDistrict;

  @override
  bool get isEmpty =>
      iceDistrict == null && rockDistrict == null && super.isEmpty;

  TravelFilter({
    this.iceDistrict,
    this.rockDistrict,
    super.city,
    super.region,
  });

  // @override
  // bool isMatch(DataWithUUID data) {

  //   bool match = true;

  //   return match;
  // }
}
