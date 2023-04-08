import 'package:my_climbing_trek/core/data/sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';

class RockSector extends Sector {
  final bool hasBouldering;
  final bool hasRope;
  final bool hasTrad;
  final bool hasDryTooling;

  RockSector({
    required super.name,
    required RockDistrict district,
    super.id,
    super.image,
    this.hasBouldering = false,
    this.hasDryTooling = false,
    this.hasRope = false,
    this.hasTrad = false,
  }) : super(district: district);
}
