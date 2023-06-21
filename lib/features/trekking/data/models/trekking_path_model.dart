import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';

part 'trekking_path_model.g.dart';

@JsonSerializable(converters: [
  RegionConverter(),
  TrekkingTypeConverter(),
  TrekSectionStringConverter(),
  TrekkingPathEventConverter(),
  TrekStringConverter(),
  EpochDateTimeConverter(),
])
class TrekkingPathModel extends TrekkingPath {
  TrekkingPathModel({
    required super.date,
    required super.region,
    required super.type,
    super.climbDown,
    super.climbUp,
    super.currentSection,
    super.events,
    super.finish,
    super.id,
    super.length,
    super.start,
    super.trek,
    super.turn,
    String trekId = '',
  });

  @JsonKey(name: 'trekId')
  String? get trekId => trek?.id;

  factory TrekkingPathModel.fromJson(Map<String, dynamic> json) =>
      _$TrekkingPathModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrekkingPathModelToJson(this);
}
