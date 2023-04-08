import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_treaning_model.g.dart';

@JsonSerializable(converters: [
  RockDistrictConverter(),
  RockSectorConverter(),
  RockTreaningAttemptConverter(),
])
class RockTreaningModel extends RockTreaning {
  RockTreaningModel({
    required super.date,
    required super.district,
    super.attempts,
    required super.sectors,
    super.finish,
    super.id,
    super.start,
  });

  factory RockTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$RockTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$RockTreaningModelToJson(this);
}
