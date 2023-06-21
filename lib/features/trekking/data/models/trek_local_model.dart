import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_model.dart';

part 'trek_local_model.g.dart';

@JsonSerializable(converters: [
  RegionConverter(),
  TrekkingTypeConverter(),
  TrekSectionLocalConverter(),
])
class TrekLocalModel extends TrekModel {
  TrekLocalModel({
    required super.name,
    required super.sections,
    required super.region,
    required super.type,
    super.id,
    super.image,
    super.links,
    super.mapImage,
  });

  factory TrekLocalModel.fromJson(Map<String, dynamic> json) =>
      _$TrekLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TrekLocalModelToJson(this);
}
