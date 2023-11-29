import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/ascension_event_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/ascension_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_route_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_route_roop_model.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';

class MountainRouteTypeConverter
    implements JsonConverter<MountainRouteType, String> {
  const MountainRouteTypeConverter();
  @override
  MountainRouteType fromJson(String json) {
    return MountainRouteType.getById(json);
  }

  @override
  String toJson(MountainRouteType object) {
    return object.id;
  }
}

class MountaineeringCategoryConverter
    implements JsonConverter<MountaineeringCategory, String> {
  const MountaineeringCategoryConverter();
  @override
  MountaineeringCategory fromJson(String json) {
    return MountaineeringCategory.getById(json);
  }

  @override
  String toJson(MountaineeringCategory object) {
    return object.id;
  }
}

class RoutePieceTypeConverter implements JsonConverter<RoutePieceType, String> {
  const RoutePieceTypeConverter();
  @override
  RoutePieceType fromJson(String json) {
    switch (json) {
      case 'ice':
        return RoutePieceType.ice;
      case 'rock':
        return RoutePieceType.ice;
      case 'mixed':
        return RoutePieceType.ice;
      default:
        throw 'No converter for RoutePieceType: $json';
    }
  }

  @override
  String toJson(RoutePieceType object) {
    return object.name;
  }
}

class MountainRouteRoopConverter
    implements JsonConverter<MountainRouteRoop, Map<String, dynamic>> {
  const MountainRouteRoopConverter();
  @override
  MountainRouteRoop fromJson(Map<String, dynamic> json) {
    return MountainRouteRoopModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MountainRouteRoop object) {
    return (object as MountainRouteRoopModel).toJson();
  }
}

class MountainRoutePieceConverter
    implements JsonConverter<MountainRoutePiece, Map<String, dynamic>> {
  const MountainRoutePieceConverter();
  @override
  MountainRoutePiece fromJson(Map<String, dynamic> json) {
    final String type = json['type'];
    switch (type) {
      case 'ice':
        return MountainRouteIcePieceModel.fromJson(json);
      case 'rock':
        return MountainRouteRockPieceModel.fromJson(json);
      case 'mixed':
        return MountainRouteMixedPieceModel.fromJson(json);
      default:
        throw 'No converter for MountainRoutePiece with type: $type';
    }
  }

  @override
  Map<String, dynamic> toJson(MountainRoutePiece object) {
    switch (object.type) {
      case RoutePieceType.ice:
        return (object as MountainRouteIcePieceModel).toJson();
      case RoutePieceType.rock:
        return (object as MountainRouteRockPieceModel).toJson();
      case RoutePieceType.mixed:
        return (object as MountainRouteMixedPieceModel).toJson();
      default:
        throw 'No converter for MountainRoutePiece with type: ${object.type}';
    }
  }
}

class AscensionEventTypeConverter
    implements JsonConverter<AscensionEventType, String> {
  const AscensionEventTypeConverter();
  @override
  AscensionEventType fromJson(String json) {
    return AscensionEventType.getById(json);
  }

  @override
  String toJson(AscensionEventType object) {
    return object.id;
  }
}

class MountainStringConverter implements JsonConverter<Mountain, String> {
  const MountainStringConverter();

  @override
  Mountain fromJson(String json) {
    return MountainModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(Mountain object) {
    if (object is MountainModel) {
      return jsonEncode(object.toJson());
    } else {
      return jsonEncode(MountainModel(
        altitude: object.altitude,
        image: object.image,
        name: object.name,
        region: object.region,
        id: object.id,
      ).toJson());
    }
  }
}

class MountainRouteStringConverter
    implements JsonConverter<MountainRoute, String> {
  const MountainRouteStringConverter();

  @override
  MountainRoute fromJson(String json) {
    return MountainRouteModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(MountainRoute object) {
    if (object is MountainRouteModel) {
      return jsonEncode(object.toJson());
    } else {
      return jsonEncode(MountainRouteModel(
        category: object.category,
        image: object.image,
        name: object.name,
        type: object.type,
        aidCategory: object.aidCategory,
        author: object.author,
        climbingCategory: object.climbingCategory,
        descent: object.descent,
        description: object.description,
        farLink: object.farLink,
        firstAscentYear: object.firstAscentYear,
        length: object.length,
        links: object.links,
        passage: object.passage,
        roops: object.roops,
        ueaaSchemaImage: object.ueaaSchemaImage,
        ussrCategory: object.ussrCategory,
        id: object.id,
      ).toJson());
    }
  }
}

class AscensionEventConverter
    implements JsonConverter<AscensionEvent, Map<String, dynamic>> {
  const AscensionEventConverter();
  @override
  AscensionEvent fromJson(Map<String, dynamic> json) {
    return AscensionEventModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AscensionEvent object) {
    if (object is AscensionEventModel) {
      return (object).toJson();
    } else {
      return AscensionEventModel(
        ascensionId: object.ascensionId,
        type: object.type,
        id: object.id,
        planedTime: object.planedTime,
        time: object.time,
      ).toJson();
    }
  }
}

class AscensionConverter
    implements JsonConverter<Ascension, Map<String, dynamic>> {
  const AscensionConverter();
  @override
  Ascension fromJson(Map<String, dynamic> json) {
    return AscensionModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Ascension object) {
    if (object is AscensionModel) {
      return (object).toJson();
    } else {
      return AscensionModel(
        date: object.date,
        mountain: object.mountain,
        route: object.route,
        events: object.events,
        finish: object.finish,
        id: object.id,
        start: object.start,
        mountainId: object.mountain.id,
        routeId: object.route.id,
      ).toJson();
    }
  }
}
