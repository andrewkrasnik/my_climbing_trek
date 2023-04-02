import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';

part 'strength_exercise_model.g.dart';

@JsonSerializable()
class StrengthExerciseModel extends StrengthExercise {
  final bool selected;
  StrengthExerciseModel({
    required this.selected,
    required super.name,
    required super.repetitions,
    super.id,
  });

  factory StrengthExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$StrengthExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StrengthExerciseModelToJson(this);

  StrengthExerciseModel copyWith({
    bool? selected,
    String? name,
    int? repetitions,
  }) {
    return StrengthExerciseModel(
      selected: selected ?? this.selected,
      name: name ?? this.name,
      repetitions: repetitions ?? this.repetitions,
      id: id,
    );
  }
}
