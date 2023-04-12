import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hall_treaning_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  GumStringConverter(),
  ClimbingHallAttemptConverter(),
])
class HallTreaningModel extends ClimbingHallTreaning {
  HallTreaningModel({
    required super.date,
    required super.climbingHall,
    required super.attempts,
    super.id,
    super.finish,
    super.start,
    String hallId = '',
  });

  @JsonKey(name: 'hallId')
  String get hallId => climbingHall.id;

  factory HallTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$HallTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$HallTreaningModelToJson(this);
}
