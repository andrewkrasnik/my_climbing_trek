import 'package:climbing_diary/core/data/ice_category.dart';
import 'package:climbing_diary/core/data/sector.dart';

class IceSector extends Sector {
  final bool waterfallIce;
  final bool glacierIce;
  final bool artificialIce;
  final String description;
  final int lenght;
  final IceCategory maxCategory;

  String get iceType {
    if (waterfallIce) {
      return 'Водопадный';
    }
    if (glacierIce) {
      return 'Ледниковый';
    }
    return 'Искусственный';
  }

  IceSector({
    required super.name,
    required super.district,
    required this.lenght,
    required this.maxCategory,
    super.image,
    this.waterfallIce = false,
    this.glacierIce = false,
    this.artificialIce = false,
    this.description = '',
  });
}
