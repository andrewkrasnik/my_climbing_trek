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
  AscentType? ascentType;
  final ClimbingStyle style;

  ClimbingCategory get routeCategory => category;
  Color? get routeColor => route?.color.materialColor;

  bool get planed => _start == null;
  bool get finished => _finish != null;

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

  ClimbingHallAttempt copy() =>
      ClimbingHallAttempt(route: route, style: style, category: category);

  void start() {
    _start = DateTime.now();
  }

  void finish() {
    _finish = DateTime.now();
  }
}
