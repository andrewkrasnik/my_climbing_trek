import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/places_repository.dart';
import 'package:my_climbing_trek/service_locator.dart';

class IceDistrictModel extends IceDistrict {
  IceDistrictModel({
    super.compact,
    required super.name,
    required super.region,
    super.image,
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
        region: getIt<PlacesRepository>().regionById(json['region']),
        name: json['name'],
        compact: json['compact'] ?? false,
        image: json['image'],
        id: json['id'],
      );
}
