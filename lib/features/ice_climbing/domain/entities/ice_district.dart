import 'package:climbing_diary/core/data/district.dart';

class IceDistrict extends District {
  IceDistrict({
    required super.name,
    required super.region,
    super.image,
    super.sectors,
  });
}
