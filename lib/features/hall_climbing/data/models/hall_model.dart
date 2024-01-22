import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hall_model.g.dart';

@JsonSerializable(converters: [
  CityConverter(),
])
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
    super.hasAutoBelay,
    super.hasDrytooling,
    super.id,
    super.hasEditPermission,
  }) : super(point: const MapPoint(latitude: 0, longitude: 0));

  factory HallModel.fromJson(Map<String, dynamic> json) =>
      _$HallModelFromJson(json);

  Map<String, dynamic> toJson() => _$HallModelToJson(this);
}
