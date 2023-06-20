import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_point_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_section_model.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_poin_feature.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
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
    // TODO: implement toJson
    throw UnimplementedError();
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
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class TrekPointStringConverter implements JsonConverter<TrekPoint, String> {
  const TrekPointStringConverter();
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
