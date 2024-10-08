import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_district_model.g.dart';

@JsonSerializable(converters: [MapPointConverter(), RegionConverter()])
class RockDistrictModel extends RockDistrict {
  RockDistrictModel({
    super.compact,
    required super.name,
    required super.region,
    super.mapPoint,
    super.image,
    super.id,
    super.hasEditPermission,
    super.localData,
  });

  factory RockDistrictModel.fromJson(Map<String, dynamic> json) =>
      _$RockDistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$RockDistrictModelToJson(this);
}
