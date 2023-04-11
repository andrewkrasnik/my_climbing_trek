import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_route_model.g.dart';

@JsonSerializable(
    converters: [ClimbingCategoryConverter(), ClimbingRouteTypeConverter()])
class RockRouteModel extends RockRoute {
  RockRouteModel({
    required super.name,
    required super.category,
    required super.type,
    super.id,
    super.anchor = '',
    super.length = 0,
    super.boltCount = 0,
    super.number,
    super.remark = '',
    super.author = '',
  });

  factory RockRouteModel.fromJson(Map<String, dynamic> json) =>
      _$RockRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RockRouteModelToJson(this);
}
