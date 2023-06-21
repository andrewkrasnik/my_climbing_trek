import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_local_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_point_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_section_local_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_section_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trekking_path_event_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trekking_path_model.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_poin_feature.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TrekkingTypeConverter implements JsonConverter<TrekkingType, String> {
  const TrekkingTypeConverter();
  @override
  TrekkingType fromJson(String json) {
    return TrekkingType.getById(json);
  }

  @override
  String toJson(TrekkingType object) {
    return object.id;
  }
}

class TrekkingEventTypeConverter
    implements JsonConverter<TrekkingEventType, String> {
  const TrekkingEventTypeConverter();
  @override
  TrekkingEventType fromJson(String json) {
    return TrekkingEventType.getById(json);
  }

  @override
  String toJson(TrekkingEventType object) {
    return object.id;
  }
}

class TrekPointFeatureConverter
    implements JsonConverter<TrekPointFeature, String> {
  const TrekPointFeatureConverter();
  @override
  TrekPointFeature fromJson(String json) {
    return TrekPointFeature.getById(json);
  }

  @override
  String toJson(TrekPointFeature object) {
    return object.id;
  }
}

class TrekPointTypeConverter implements JsonConverter<TrekPointType, String> {
  const TrekPointTypeConverter();
  @override
  TrekPointType fromJson(String json) {
    return TrekPointType.getById(json);
  }

  @override
  String toJson(TrekPointType object) {
    return object.id;
  }
}

class TrekSectionConverter
    implements JsonConverter<TrekSection, Map<String, dynamic>> {
  const TrekSectionConverter();
  @override
  TrekSection fromJson(Map<String, dynamic> json) {
    return TrekSectionModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TrekSection object) {
    if (object is TrekSectionModel) {
      return object.toJson();
    } else {
      return TrekSectionModel(
        start: object.start,
        finish: object.finish,
        length: object.length,
        description: object.description,
      ).toJson();
    }
  }
}

class TrekSectionLocalConverter
    implements JsonConverter<TrekSection, Map<String, dynamic>> {
  const TrekSectionLocalConverter();
  @override
  TrekSection fromJson(Map<String, dynamic> json) {
    return TrekSectionLocalModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TrekSection object) {
    if (object is TrekSectionLocalModel) {
      return object.toJson();
    } else {
      return TrekSectionLocalModel(
        start: object.start,
        finish: object.finish,
        length: object.length,
        description: object.description,
      ).toJson();
    }
  }
}

class TrekSectionStringConverter implements JsonConverter<TrekSection, String> {
  const TrekSectionStringConverter();

  @override
  TrekSection fromJson(String json) {
    return const TrekSectionLocalConverter().fromJson(jsonDecode(json));
  }

  @override
  String toJson(TrekSection object) {
    return jsonEncode(const TrekSectionLocalConverter().toJson(object));
  }
}

class TrekConverter implements JsonConverter<Trek, Map<String, dynamic>> {
  const TrekConverter();
  @override
  Trek fromJson(Map<String, dynamic> json) {
    return TrekModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Trek object) {
    if (object is TrekModel) {
      return object.toJson();
    } else {
      return TrekModel(
        name: object.name,
        sections: object.sections,
        region: object.region,
        type: object.type,
        id: object.id,
        image: object.image,
        links: object.links,
        mapImage: object.mapImage,
      ).toJson();
    }
  }
}

class TrekLocalConverter implements JsonConverter<Trek, Map<String, dynamic>> {
  const TrekLocalConverter();
  @override
  Trek fromJson(Map<String, dynamic> json) {
    return TrekLocalModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Trek object) {
    if (object is TrekLocalModel) {
      return object.toJson();
    } else {
      return TrekLocalModel(
        name: object.name,
        sections: object.sections,
        region: object.region,
        type: object.type,
        id: object.id,
        image: object.image,
        links: object.links,
        mapImage: object.mapImage,
      ).toJson();
    }
  }
}

class TrekStringConverter implements JsonConverter<Trek, String> {
  const TrekStringConverter();

  @override
  Trek fromJson(String json) {
    return TrekLocalModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(Trek object) {
    return jsonEncode(const TrekLocalConverter().toJson(object));
  }
}

class TrekPointConverter
    implements JsonConverter<TrekPoint, Map<String, dynamic>> {
  const TrekPointConverter();
  @override
  TrekPoint fromJson(Map<String, dynamic> json) {
    return TrekPointModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TrekPoint object) {
    if (object is TrekPointModel) {
      return object.toJson();
    } else {
      return TrekPointModel(
        name: object.name,
        type: object.type,
        altitude: object.altitude,
        description: object.description,
        features: object.features,
        id: object.id,
        image: object.image,
        mapPoint: object.mapPoint,
      ).toJson();
    }
  }
}

class TrekPointStringConverter implements JsonConverter<TrekPoint, String> {
  const TrekPointStringConverter();

  @override
  TrekPoint fromJson(String json) {
    return TrekPointModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(TrekPoint object) {
    return jsonEncode((object as TrekPointModel).toJson());
  }
}

class TrekPointIdConverter implements JsonConverter<TrekPoint, String> {
  const TrekPointIdConverter();
  @override
  TrekPoint fromJson(String json) {
    return getIt<TrekkingRemoteDataSource>()
        .points
        .firstWhere((element) => element.id == json);
  }

  @override
  String toJson(TrekPoint object) {
    return object.id;
  }
}

class TrekkingPathEventConverter
    implements JsonConverter<TrekkingPathEvent, Map<String, dynamic>> {
  const TrekkingPathEventConverter();
  @override
  TrekkingPathEvent fromJson(Map<String, dynamic> json) {
    return TrekkingPathEventModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TrekkingPathEvent object) {
    if (object is TrekkingPathEventModel) {
      return object.toJson();
    } else {
      return TrekkingPathEventModel(
        pathId: object.pathId,
        type: object.type,
        time: object.time,
        id: object.id,
        point: object.point,
      ).toJson();
    }
  }
}

class TrekkingPathConverter
    implements JsonConverter<TrekkingPath, Map<String, dynamic>> {
  const TrekkingPathConverter();
  @override
  TrekkingPath fromJson(Map<String, dynamic> json) {
    return TrekkingPathModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TrekkingPath object) {
    if (object is TrekkingPathModel) {
      return object.toJson();
    } else {
      return TrekkingPathModel(
        start: object.start,
        finish: object.finish,
        length: object.length,
        date: object.date,
        region: object.region,
        type: object.type,
        climbDown: object.climbDown,
        climbUp: object.climbUp,
        currentSection: object.currentSection,
        events: object.events,
        id: object.id,
        trek: object.trek,
        turn: object.turn,
      ).toJson();
    }
  }
}
