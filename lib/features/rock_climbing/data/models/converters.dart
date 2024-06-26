import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/core/data/district.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_district_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_route_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_sector_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_treaning_attempt_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';

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
    if (object is RockSectorModel) {
      return object.toJson();
    } else {
      return RockSectorModel(
        name: object.name,
        image: object.image,
        id: object.id,
        hasAid: object.hasAid,
        hasBouldering: object.hasBouldering,
        hasDryTooling: object.hasDryTooling,
        hasRope: object.hasRope,
        hasTrad: object.hasTrad,
      ).toJson();
    }
  }
}

class RockSectorsStringConverter
    implements JsonConverter<List<RockSector>, String> {
  const RockSectorsStringConverter();
  @override
  List<RockSector> fromJson(String json) {
    final sectors = jsonDecode(json) as List<dynamic>;
    return sectors.map((sector) => RockSectorModel.fromJson(sector)).toList();
  }

  @override
  String toJson(List<RockSector> objects) {
    return jsonEncode(
        objects.map((object) => (object as RockSectorModel).toJson()).toList());
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
    if (object is RockRouteModel) {
      return object.toJson();
    } else {
      return RockRouteModel(
        name: object.name,
        category: object.category,
        type: object.type,
        anchor: object.anchor,
        author: object.author,
        boltCount: object.boltCount,
        id: object.id,
        length: object.length,
        number: object.number,
        remark: object.remark,
      ).toJson();
    }
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
        ascentType: object.ascentType,
      ).toJson();
    }
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
