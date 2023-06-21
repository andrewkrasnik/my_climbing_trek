import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_section_model.dart';

part 'trek_section_local_model.g.dart';

@JsonSerializable(converters: [TrekPointConverter()])
class TrekSectionLocalModel extends TrekSectionModel {
  TrekSectionLocalModel({
    required super.start,
    required super.finish,
    required super.length,
    super.description,
  });

  factory TrekSectionLocalModel.fromJson(Map<String, dynamic> json) =>
      _$TrekSectionLocalModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TrekSectionLocalModelToJson(this);
}
