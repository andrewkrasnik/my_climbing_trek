import 'package:my_climbing_trek/core/data/ascent_type.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:flutter/material.dart';

class ClimbingHallAttempt {
  int? id;
  final ClimbingHallRoute? route;
  final ClimbingCategory category;
  DateTime? startTime;
  DateTime? finishTime;
  AscentType? ascentType;
  int suspensionCount = 0;
  int fallCount = 0;
  bool downClimbing = false;
  bool fail = false;

  final ClimbingStyle style;

  ClimbingCategory get routeCategory => category;
  Color? get routeColor => route?.color.materialColor;

  bool get planed => startTime == null;
  bool get finished => finishTime != null;
  bool get started => startTime != null && finishTime == null;

  String get result =>
      fail ? 'Не долез' : (ascentType == null ? 'Долез' : 'Долез $ascentType');

  // int get suspensionCount => _suspensionCount;
  // int get fallCount => _fallCount;
  // bool get downClimbing => _downClimbing;
  // AscentType? get ascentType => _ascentType;
  // bool get fail => _fail;
  // DateTime? get getStart => _start;
  // DateTime? get getFinish => _finish;

  ClimbingHallAttempt({
    required this.category,
    required this.style,
    this.route,
    this.id,
  });

  ClimbingHallAttempt.fromRoute({
    required this.route,
    required this.style,
    this.id,
  }) : category = route!.category;

  ClimbingHallAttempt copy() => ClimbingHallAttempt(
        route: route,
        style: style,
        category: category,
      );

  void start() {
    startTime = DateTime.now();
  }

  void finish({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    int attemptCount = 0,
  }) {
    finishTime = DateTime.now();
    this.suspensionCount = suspensionCount;
    this.fallCount = fallCount;
    this.downClimbing = downClimbing;
    this.fail = fail;

    if (!fail &&
        style == ClimbingStyle.lead &&
        route != null &&
        fallCount == 0 &&
        suspensionCount == 0) {
      if (attemptCount == 0) {
        ascentType = AscentType.onsite;
      } else {
        ascentType = AscentType.redPoint;
      }
    }
  }
}
