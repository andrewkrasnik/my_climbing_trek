import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/data/district.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_district_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_sector_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_treaning_attempt_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';

class IceDistrictConverter
    implements JsonConverter<IceDistrict, Map<String, dynamic>> {
  const IceDistrictConverter();
  @override
  IceDistrict fromJson(Map<String, dynamic> json) {
    return IceDistrictModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(District object) {
    return (object as IceDistrictModel).toJson();
  }
}

class DistrictConverter
    implements JsonConverter<District, Map<String, dynamic>> {
  const DistrictConverter();
  @override
  IceDistrict fromJson(Map<String, dynamic> json) {
    return IceDistrictModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(District object) {
    return (object as IceDistrictModel).toJson();
  }
}

class IceDistrictStringConverter implements JsonConverter<IceDistrict, String> {
  const IceDistrictStringConverter();
  @override
  IceDistrict fromJson(String json) {
    return IceDistrictModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(District object) {
    return jsonEncode((object as IceDistrictModel).toJson());
  }
}

class IceSectorStringConverter implements JsonConverter<IceSector, String> {
  const IceSectorStringConverter();
  @override
  IceSector fromJson(String json) {
    return IceSectorModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(IceSector object) {
    return jsonEncode((object as IceSectorModel).toJson());
  }
}

class IceSectorsStringConverter
    implements JsonConverter<List<IceSector>, String> {
  const IceSectorsStringConverter();
  @override
  List<IceSector> fromJson(String json) {
    final sectors = jsonDecode(json) as List<dynamic>;
    return sectors.map((sector) => IceSectorModel.fromJson(sector)).toList();
  }

  @override
  String toJson(List<IceSector> objects) {
    return jsonEncode(
        objects.map((object) => (object as IceSectorModel).toJson()).toList());
  }
}

class IceTreaningAttemptConverter
    implements JsonConverter<IceTreaningAttempt, Map<String, dynamic>> {
  const IceTreaningAttemptConverter();
  @override
  IceTreaningAttempt fromJson(Map<String, dynamic> json) {
    return IceTreaningAttemptModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(IceTreaningAttempt object) {
    if (object is IceTreaningAttemptModel) {
      return object.toJson();
    } else {
      return IceTreaningAttemptModel(
        category: object.category,
        sector: object.sector,
        style: object.style,
        treaningId: object.treaningId,
        downClimbing: object.downClimbing,
        fail: object.downClimbing,
        fallCount: object.fallCount,
        finishTime: object.finishTime,
        id: object.id,
        startTime: object.startTime,
        suspensionCount: object.suspensionCount,
        iceScrewsCount: object.iceScrewsCount,
        installedIceScrews: object.installedIceScrews,
        toolsCount: object.toolsCount,
        wayLength: object.wayLength,
      ).toJson();
    }
  }
}
