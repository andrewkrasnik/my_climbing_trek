import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/region.dart';

class PlaceFilter {
  City? city;
  Region? region;

  bool get isEmpty => city == null && region == null;

  bool get isNotEmpty => !isEmpty;

  PlaceFilter({
    this.city,
    this.region,
  });

  bool isMatch(DataWithUUID data) => true;
}
