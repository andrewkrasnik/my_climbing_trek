import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ice_district_model.g.dart';

@JsonSerializable(converters: [MapPointConverter(), RegionConverter()])
class IceDistrictModel extends IceDistrict {
  IceDistrictModel({
    super.compact,
    required super.name,
    required super.region,
    super.image,
    super.id,
  });

  factory IceDistrictModel.fromJson(Map<String, dynamic> json) =>
      _$IceDistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$IceDistrictModelToJson(this);
}
