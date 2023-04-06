import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

class IceSectorModel extends IceSector {
  IceSectorModel({
    required super.name,
    required super.district,
    required super.length,
    required super.maxCategory,
    super.image,
    super.waterfallIce,
    super.glacierIce,
    super.artificialIce,
    super.description,
    super.id,
  });

  Map<String, dynamic> toJson() => {
        'district': district.id,
        'name': name,
        'maxCategory': maxCategory.id,
        'image': image,
        'waterfallIce': waterfallIce,
        'glacierIce': glacierIce,
        'artificialIce': artificialIce,
        'description': description,
        'length': length,
        'id': id,
      };

  factory IceSectorModel.fromJson(
          Map<String, dynamic> json, IceDistrict district) =>
      IceSectorModel(
        district: district,
        maxCategory: IceCategory.getById(json['maxCategory']),
        name: json['name'],
        length: json['length'],
        waterfallIce: json['waterfallIce'] ?? false,
        glacierIce: json['glacierIce'] ?? false,
        artificialIce: json['artificialIce'] ?? false,
        image: json['image'],
        description: json['description'],
        id: json['id'],
      );
}
