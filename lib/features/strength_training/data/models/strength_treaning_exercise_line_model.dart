import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/strength_training/data/models/converters.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'strength_treaning_exercise_line_model.g.dart';

@JsonSerializable(converters: [
  StrengthExerciseStringConverter(),
  EpochDateTimeConverter(),
  RepetitionsStringConverter(),
])
class StrengthTreaningExerciseLineModel extends StrengthTreaningExerciseLine {
  StrengthTreaningExerciseLineModel({
    required super.treaningId,
    required super.exercise,
    super.repetitions,
    super.id,
    String exerciseId = '',
  });

  @JsonKey(name: 'exerciseId')
  String get exerciseId => exercise.id;

  factory StrengthTreaningExerciseLineModel.fromJson(
          Map<String, dynamic> json) =>
      _$StrengthTreaningExerciseLineModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StrengthTreaningExerciseLineModelToJson(this);
}
