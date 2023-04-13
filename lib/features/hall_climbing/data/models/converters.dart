import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_attempt_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_route_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/route_color.dart';

class GumRouteStringConverter
    implements JsonConverter<ClimbingHallRoute, String> {
  const GumRouteStringConverter();
  @override
  ClimbingHallRoute fromJson(String json) {
    return HallRouteModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(ClimbingHallRoute object) {
    return jsonEncode((object as HallRouteModel).toJson());
  }
}

class GumStringConverter implements JsonConverter<ClimbingHall, String> {
  const GumStringConverter();
  @override
  ClimbingHall fromJson(String json) {
    return HallModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(ClimbingHall object) {
    return jsonEncode((object as HallModel).toJson());
  }
}

class RouteColorConverter implements JsonConverter<RouteColor, String> {
  const RouteColorConverter();
  @override
  RouteColor fromJson(String json) {
    return RouteColor.getById(json);
  }

  @override
  String toJson(RouteColor object) {
    return object.id;
  }
}

class ClimbingHallAttemptConverter
    implements JsonConverter<ClimbingHallAttempt, Map<String, dynamic>> {
  const ClimbingHallAttemptConverter();
  @override
  ClimbingHallAttempt fromJson(Map<String, dynamic> json) {
    return HallAttemptModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ClimbingHallAttempt object) {
    if (object is HallAttemptModel) {
      return object.toJson();
    } else {
      return HallAttemptModel(
        category: object.category,
        style: object.style,
        treaningId: object.treaningId,
        downClimbing: object.downClimbing,
        fail: object.fail,
        fallCount: object.fallCount,
        finishTime: object.finishTime,
        id: object.id,
        route: object.route,
        startTime: object.startTime,
        suspensionCount: object.suspensionCount,
        ascentType: object.ascentType,
      ).toJson();
    }
  }
}
