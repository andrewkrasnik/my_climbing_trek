import 'package:my_climbing_trek/core/data/ascent_type.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';

class ClimbingHallAttempt extends DataWithUUID {
  final ClimbingHallRoute? route;
  final ClimbingCategory category;
  final String treaningId;
  DateTime? startTime;
  DateTime? finishTime;
  AscentType? ascentType;
  int suspensionCount;
  int fallCount;
  bool downClimbing;
  bool fail;

  final ClimbingStyle style;

  ClimbingCategory get routeCategory => category;
  Color? get routeColor => route?.color.materialColor;

  bool get planed => startTime == null;
  bool get finished => finishTime != null;
  bool get started => startTime != null && finishTime == null;

  String get result =>
      fail ? 'Не долез' : (ascentType == null ? 'Долез' : 'Долез $ascentType');

  ClimbingHallAttempt({
    required this.category,
    required this.style,
    required this.treaningId,
    this.route,
    super.id,
    this.ascentType,
    this.downClimbing = false,
    this.fail = false,
    this.fallCount = 0,
    this.finishTime,
    this.startTime,
    this.suspensionCount = 0,
  });

  ClimbingHallAttempt copy() => ClimbingHallAttempt(
        route: route,
        style: style,
        category: category,
        treaningId: treaningId,
      );

  void start() {
    startTime = DateTime.now();
  }

  void finish({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    GymRouteAttemptsStatistic? statistic,
  }) {
    finishTime = DateTime.now();
    this.suspensionCount = suspensionCount;
    this.fallCount = fallCount;
    this.downClimbing = downClimbing;
    this.fail = fail;

    if (statistic?.done == false &&
        !fail &&
        style == ClimbingStyle.lead &&
        route != null &&
        fallCount == 0 &&
        suspensionCount == 0) {
      if (statistic?.count == 1) {
        ascentType = AscentType.flash;
      } else {
        ascentType = AscentType.redPoint;
      }
    }
  }
}
