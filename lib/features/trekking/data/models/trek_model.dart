import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';

part 'trek_model.g.dart';

@JsonSerializable(converters: [
  RegionConverter(),
  TrekkingTypeConverter(),
  TrekSectionConverter(),
])
class TrekModel extends Trek {
  TrekModel({
    required super.name,
    required super.sections,
    required super.region,
    required super.type,
    super.id,
    super.image,
    super.links,
    super.mapImage,
  });

  factory TrekModel.fromJson(Map<String, dynamic> json) =>
      _$TrekModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrekModelToJson(this);
}
