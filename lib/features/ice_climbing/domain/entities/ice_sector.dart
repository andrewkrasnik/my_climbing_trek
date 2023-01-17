import 'package:climbing_diary/core/data/sector.dart';

class IceSector extends Sector {
  final bool waterfallIce;
  final bool glacierIce;
  final bool artificialIce;
  IceSector({
    required super.name,
    required super.district,
    super.image,
    this.waterfallIce = false,
    this.glacierIce = false,
    this.artificialIce = false,
  });
}
