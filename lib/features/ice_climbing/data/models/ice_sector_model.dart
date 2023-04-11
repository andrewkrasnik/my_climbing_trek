import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ice_sector_model.g.dart';

@JsonSerializable(converters: [
  DistrictConverter(),
  IceDistrictConverter(),
  IceCategoryConverter(),
])
class IceSectorModel extends IceSector {
  IceSectorModel({
    required super.name,
    required super.length,
    required super.maxCategory,
    super.image,
    super.waterfallIce,
    super.glacierIce,
    super.artificialIce,
    super.description,
    super.id,
  });

  factory IceSectorModel.fromJson(Map<String, dynamic> json) =>
      _$IceSectorModelFromJson(json);

  Map<String, dynamic> toJson() => _$IceSectorModelToJson(this);
}
