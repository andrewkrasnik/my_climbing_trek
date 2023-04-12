import 'package:my_climbing_trek/core/data/ascent_type.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';

part 'hall_attempt_model.g.dart';

@JsonSerializable(converters: [
  ClimbingCategoryConverter(),
  ClimbingStyleConverter(),
  GumRouteStringConverter(),
  EpochDateTimeConverter(),
  AscentTypeConverter(),
])
class HallAttemptModel extends ClimbingHallAttempt {
  HallAttemptModel({
    required super.category,
    required super.style,
    required super.treaningId,
    super.route,
    super.ascentType,
    super.downClimbing,
    super.fail,
    super.fallCount,
    super.finishTime,
    super.id,
    super.startTime,
    super.suspensionCount,
    String routeId = '',
  });

  @JsonKey(name: 'routeId')
  String? get routeId => route?.id;

  factory HallAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$HallAttemptModelFromJson(json);

  Map<String, dynamic> toJson() => _$HallAttemptModelToJson(this);
}
