import 'package:climbing_diary/core/data/region.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';

class IceDistrictModel extends IceDistrict {
  IceDistrictModel({
    super.compact,
    required super.name,
    required super.region,
    super.image,
    super.sectors,
    super.id,
  });

  Map<String, dynamic> toJson() => {
        'compact': compact,
        'name': name,
        'region': region.id,
        'image': image,
        'id': id,
      };

  factory IceDistrictModel.fromJson(Map<String, dynamic> json) =>
      IceDistrictModel(
        region: Region.getById(json['region']),
        name: json['name'],
        compact: json['compact'] ?? false,
        image: json['image'],
        id: json['id'],
      );
}
