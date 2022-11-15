import 'package:climbing_diary/core/data/ascent_type.dart';
import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:flutter/material.dart';

class ClimbingHallAttempt {
  final ClimbingHallRoute? route;
  final ClimbingCategory category;
  DateTime? _start;
  DateTime? _finish;
  AscentType? _ascentType;
  int _suspensionCount = 0;
  int _fallCount = 0;
  bool _downClimbing = false;
  bool _fail = false;

  final ClimbingStyle style;

  ClimbingCategory get routeCategory => category;
  Color? get routeColor => route?.color.materialColor;

  bool get planed => _start == null;
  bool get finished => _finish != null;
  bool get started => _start != null && _finish == null;

  int get suspensionCount => _suspensionCount;
  int get fallCount => _fallCount;
  bool get downClimbing => _downClimbing;
  AscentType? get ascentType => _ascentType;
  bool get fail => _fail;

  ClimbingHallAttempt({
    required this.category,
    required this.style,
    this.route,
  });

  ClimbingHallAttempt.fromRoute({
    required route,
    required this.style,
  })  : category = route.category,
        route = route;

  ClimbingHallAttempt copy() => ClimbingHallAttempt(
        route: route,
        style: style,
        category: category,
      );

  void start() {
    _start = DateTime.now();
  }

  void finish({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    int attemptCount = 0,
  }) {
    _finish = DateTime.now();
    _suspensionCount = suspensionCount;
    _fallCount = fallCount;
    _downClimbing = downClimbing;
    _fail = fail;

    if (!_fail &&
        style == ClimbingStyle.lead &&
        route != null &&
        fallCount == 0 &&
        _suspensionCount == 0) {
      if (attemptCount == 0) {
        _ascentType = AscentType.onsite;
      } else {
        _ascentType = AscentType.redPoint;
      }
    }
  }
}
