import 'package:my_climbing_trek/features/rock_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_sector_model.g.dart';

@JsonSerializable(converters: [DistrictConverter(), RockDistrictConverter()])
class RockSectorModel extends RockSector {
  RockSectorModel({
    required super.name,
    super.id,
    super.image,
    super.hasBouldering,
    super.hasDryTooling,
    super.hasRope,
    super.hasTrad,
    super.hasAid,
  });

  factory RockSectorModel.fromJson(Map<String, dynamic> json) =>
      _$RockSectorModelFromJson(json);

  Map<String, dynamic> toJson() => _$RockSectorModelToJson(this);
}
