import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/sector.dart';

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

  String get icePrefix {
    if (waterfallIce) {
      return 'W';
    }
    if (glacierIce) {
      return 'A';
    }
    return 'W';
  }

  bool get hasTopRope => !artificialIce;

  List<IceCategory> get categories => IceCategory.values
      .where((element) => element.id > 2 && element.id <= maxCategory.id)
      .toList();

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
    super.id,
  });
}
