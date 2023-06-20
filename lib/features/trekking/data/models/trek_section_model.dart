import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';

part 'trek_section_model.g.dart';

@JsonSerializable(converters: [TrekPointStringConverter()])
class TrekSectionModel extends TrekSection {
  TrekSectionModel({
    required super.start,
    required super.finish,
    required super.length,
    super.description,
  });

  factory TrekSectionModel.fromJson(Map<String, dynamic> json) =>
      _$TrekSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrekSectionModelToJson(this);
}
