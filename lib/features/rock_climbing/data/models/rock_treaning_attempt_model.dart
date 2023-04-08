import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_treaning_attempt_model.g.dart';

@JsonSerializable(converters: [
  ClimbingCategoryConverter(),
  ClimbingStyleConverter(),
  RockSectorConverter(),
  RockRouteConverter(),
])
class RockTreaningAttemptModel extends RockTreaningAttempt {
  RockTreaningAttemptModel({
    required super.sector,
    required super.category,
    required super.style,
    super.startTime,
    super.finishTime,
    super.wayLength,
    super.id,
    super.route,
    super.downClimbing = false,
    super.fallCount = 0,
    super.fail = false,
    super.suspensionCount = 0,
  });

  factory RockTreaningAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$RockTreaningAttemptModelFromJson(json);

  Map<String, dynamic> toJson() => _$RockTreaningAttemptModelToJson(this);
}
