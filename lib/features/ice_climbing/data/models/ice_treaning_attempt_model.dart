import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ice_treaning_attempt_model.g.dart';

@JsonSerializable(converters: [
  IceSectorStringConverter(),
  IceCategoryConverter(),
  ClimbingStyleConverter(),
  EpochDateTimeConverter(),
])
class IceTreaningAttemptModel extends IceTreaningAttempt {
  IceTreaningAttemptModel({
    required super.treaningId,
    required super.sector,
    required super.category,
    required super.style,
    super.startTime,
    super.finishTime,
    super.wayLength,
    super.id,
    super.downClimbing = false,
    super.fallCount = 0,
    super.iceScrewsCount = 0,
    super.fail = false,
    super.installedIceScrews = false,
    super.suspensionCount = 0,
    super.toolsCount = 2,
    String sectorId = '',
  });

  @JsonKey(name: 'sectorId')
  String get sectorId => sector.id;

  factory IceTreaningAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$IceTreaningAttemptModelFromJson(json);

  Map<String, dynamic> toJson() => _$IceTreaningAttemptModelToJson(this);
}
