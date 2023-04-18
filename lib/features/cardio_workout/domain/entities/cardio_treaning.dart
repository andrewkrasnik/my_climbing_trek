import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_exercise.dart';

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
    super.finish,
    super.start,
  });

  @override
  void finishTreaning({DateTime? finish}) {
    super.finishTreaning(finish: date);
  }
}
