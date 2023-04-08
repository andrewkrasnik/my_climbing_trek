import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_treaning_attempt_model.g.dart';

@JsonSerializable(converters: [
  ClimbingCategoryConverter(),
  ClimbingStyleConverter(),
  RockSectorStringConverter(),
  RockRouteStringConverter(),
  EpochDateTimeConverter(),
])
class RockTreaningAttemptModel extends RockTreaningAttempt {
  RockTreaningAttemptModel({
    required super.treaningId,
    required super.sector,
    required super.category,
    required super.style,
    super.startTime,
    super.finishTime,
    super.id,
    super.route,
    super.downClimbing = false,
    super.fallCount = 0,
    super.fail = false,
    super.suspensionCount = 0,
    String sectorId = '',
    String routeId = '',
  });

  @JsonKey(name: 'sectorId')
  String get sectorId => sector.id;

  @JsonKey(name: 'routeId')
  String? get routeId => route?.id;

  factory RockTreaningAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$RockTreaningAttemptModelFromJson(json);

  Map<String, dynamic> toJson() => _$RockTreaningAttemptModelToJson(this);
}
