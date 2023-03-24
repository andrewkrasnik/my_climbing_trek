import 'package:climbing_diary/core/data/district.dart';

class IceDistrict extends District {
  final bool compact;

  IceDistrict({
    this.compact = false,
    required super.name,
    required super.region,
    super.image,
    super.sectors,
  });
}
