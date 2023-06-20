import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

part 'trek_point_model.g.dart';

@JsonSerializable(converters: [
  TrekPointTypeConverter(),
  MapPointConverter(),
  TrekPointFeatureConverter(),
])
class TrekPointModel extends TrekPoint {
  TrekPointModel({
    required super.name,
    required super.type,
    super.altitude,
    super.description,
    super.features,
    super.id,
    super.image,
    super.mapPoint,
  });

  factory TrekPointModel.fromJson(Map<String, dynamic> json) =>
      _$TrekPointModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrekPointModelToJson(this);
}
