import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_exercise.dart';

class CardioTreaning extends Treaning {
  final int duration;
  final CardioExercise exercise;
  final double length;

  CardioTreaning({
    super.id,
    required super.date,
    required this.duration,
    required this.exercise,
    required this.length,
  });
}
