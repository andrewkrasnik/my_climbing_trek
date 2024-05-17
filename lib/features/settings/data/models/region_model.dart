import 'package:my_climbing_trek/core/data/region.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.g.dart';

@JsonSerializable()
class RegionModel extends Region {
  RegionModel({
    required super.name,
    super.id,
    super.image,
    super.hasEditPermission,
  }) : super(state: '');

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}
