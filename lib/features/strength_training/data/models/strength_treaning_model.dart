import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/strength_training/data/models/converters.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'strength_treaning_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  StrengthTreaningExerciseLineConverter(),
])
class StrengthTreaningModel extends StrengthTreaning {
  StrengthTreaningModel({
    super.id,
    super.attempts,
    required super.date,
    super.finish,
    super.start,
  });

  factory StrengthTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$StrengthTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$StrengthTreaningModelToJson(this);
}
