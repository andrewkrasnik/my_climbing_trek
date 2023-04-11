import 'package:json_annotation/json_annotation.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_exercise.dart';

class CardioExerciseConverter implements JsonConverter<CardioExercise, String> {
  const CardioExerciseConverter();
  @override
  CardioExercise fromJson(String json) {
    return CardioExercise.getById(json);
  }

  @override
  String toJson(CardioExercise object) {
    return object.id;
  }
}
