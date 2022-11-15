import 'package:climbing_diary/core/data/map_point.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hall_model.g.dart';

@JsonSerializable()
class HallModel extends ClimbingHall {
  const HallModel({
    required super.name,
    required super.address,
    required super.city,
    required super.image,
    required super.telephone,
    required super.website,
    required super.email,
    super.hasBigWall,
    super.hasBouldering,
    super.hasSpeed,
    super.id,
  }) : super(point: const MapPoint());

  factory HallModel.fromJson(Map<String, dynamic> json) =>
      _$HallModelFromJson(json);

  Map<String, dynamic> toJson() => _$HallModelToJson(this);
}
