import 'package:climbing_diary/core/data/ice_category.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';

class IceSectorModel extends IceSector {
  IceSectorModel({
    required super.name,
    required super.district,
    required super.lenght,
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
        'lenght': lenght,
        'id': id,
      };

  factory IceSectorModel.fromJson(
          Map<String, dynamic> json, IceDistrict district) =>
      IceSectorModel(
        district: district,
        maxCategory: IceCategory.getById(json['maxCategory']),
        name: json['name'],
        lenght: json['lenght'],
        waterfallIce: json['waterfallIce'] ?? false,
        glacierIce: json['glacierIce'] ?? false,
        artificialIce: json['artificialIce'] ?? false,
        image: json['image'],
        description: json['description'],
        id: json['id'],
      );
}
