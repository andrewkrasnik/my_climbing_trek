import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mountain_model.g.dart';

@JsonSerializable(converters: [RegionConverter()])
class MountainModel extends Mountain {
  MountainModel({
    required super.region,
    required super.name,
    required super.altitude,
    required super.image,
    super.id,
  });

  factory MountainModel.fromJson(Map<String, dynamic> json) =>
      _$MountainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MountainModelToJson(this);
}
