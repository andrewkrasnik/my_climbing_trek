import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/cardio_workout/data/models/converters.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cardio_treaning_model.g.dart';

@JsonSerializable(converters: [
  CardioExerciseConverter(),
  EpochDateTimeConverter(),
])
class CardioTreaningModel extends CardioTreaning {
  CardioTreaningModel({
    super.id,
    required super.date,
    required super.duration,
    required super.exercise,
    required super.length,
    super.finish,
    super.start,
  });

  factory CardioTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$CardioTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardioTreaningModelToJson(this);
}
