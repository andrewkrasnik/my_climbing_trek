import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/district.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_district_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_route_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_sector_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_treaning_attempt_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';

class MapPointConverter
    implements JsonConverter<MapPoint, Map<String, dynamic>> {
  const MapPointConverter();

  @override
  MapPoint fromJson(Map<String, dynamic> json) {
    return MapPoint(
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(MapPoint object) {
    return {'latitude': object.latitude, 'longitude': object.longitude};
  }
}

class RegionConverter implements JsonConverter<Region, String> {
  const RegionConverter();
  @override
  Region fromJson(String json) {
    return Region.getById(json);
  }

  @override
  String toJson(Region object) {
    return object.id;
  }
}

class RockDistrictConverter
    implements JsonConverter<RockDistrict, Map<String, dynamic>> {
  const RockDistrictConverter();
  @override
  RockDistrict fromJson(Map<String, dynamic> json) {
    return RockDistrictModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(District object) {
    return (object as RockDistrictModel).toJson();
  }
}

class DistrictConverter
    implements JsonConverter<District, Map<String, dynamic>> {
  const DistrictConverter();
  @override
  RockDistrict fromJson(Map<String, dynamic> json) {
    return RockDistrictModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(District object) {
    return (object as RockDistrictModel).toJson();
  }
}

class RockSectorConverter
    implements JsonConverter<RockSector, Map<String, dynamic>> {
  const RockSectorConverter();
  @override
  RockSector fromJson(Map<String, dynamic> json) {
    return RockSectorModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(RockSector object) {
    return (object as RockSectorModel).toJson();
  }
}

class RockRouteConverter
    implements JsonConverter<RockRoute, Map<String, dynamic>> {
  const RockRouteConverter();
  @override
  RockRoute fromJson(Map<String, dynamic> json) {
    return RockRouteModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(RockRoute object) {
    return (object as RockRouteModel).toJson();
  }
}

class RockTreaningAttemptConverter
    implements JsonConverter<RockTreaningAttempt, Map<String, dynamic>> {
  const RockTreaningAttemptConverter();
  @override
  RockTreaningAttempt fromJson(Map<String, dynamic> json) {
    return RockTreaningAttemptModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(RockTreaningAttempt object) {
    if (object is RockTreaningAttemptModel) {
      return object.toJson();
    } else {
      return RockTreaningAttemptModel(
        category: object.category,
        sector: object.sector,
        style: object.style,
        treaningId: object.treaningId,
        downClimbing: object.downClimbing,
        fail: object.downClimbing,
        fallCount: object.fallCount,
        finishTime: object.finishTime,
        id: object.id,
        route: object.route,
        startTime: object.startTime,
        suspensionCount: object.suspensionCount,
      ).toJson();
    }
  }
}

class ClimbingCategoryConverter
    implements JsonConverter<ClimbingCategory, String> {
  const ClimbingCategoryConverter();
  @override
  ClimbingCategory fromJson(String json) {
    return ClimbingCategory.getById(json);
  }

  @override
  String toJson(ClimbingCategory object) {
    return object.id;
  }
}

class ClimbingRouteTypeConverter
    implements JsonConverter<ClimbingRouteType, String> {
  const ClimbingRouteTypeConverter();
  @override
  ClimbingRouteType fromJson(String json) {
    return ClimbingRouteType.getById(json);
  }

  @override
  String toJson(ClimbingRouteType object) {
    return object.id;
  }
}

class ClimbingStyleConverter implements JsonConverter<ClimbingStyle, String> {
  const ClimbingStyleConverter();
  @override
  ClimbingStyle fromJson(String json) {
    return ClimbingStyle.getById(json);
  }

  @override
  String toJson(ClimbingStyle object) {
    return object.id;
  }
}

class RockDistrictStringConverter
    implements JsonConverter<RockDistrict, String> {
  const RockDistrictStringConverter();
  @override
  RockDistrict fromJson(String json) {
    return RockDistrictModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(District object) {
    return jsonEncode((object as RockDistrictModel).toJson());
  }
}

class RockSectorStringConverter implements JsonConverter<RockSector, String> {
  const RockSectorStringConverter();
  @override
  RockSector fromJson(String json) {
    return RockSectorModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(RockSector object) {
    return jsonEncode((object as RockSectorModel).toJson());
  }
}

class RockRouteStringConverter implements JsonConverter<RockRoute, String> {
  const RockRouteStringConverter();
  @override
  RockRoute fromJson(String json) {
    return RockRouteModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(RockRoute object) {
    return jsonEncode((object as RockRouteModel).toJson());
  }
}

class EpochDateTimeConverter implements JsonConverter<DateTime, int> {
  const EpochDateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
