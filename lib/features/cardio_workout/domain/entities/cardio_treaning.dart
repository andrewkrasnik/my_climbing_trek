import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_exercise.dart';

class CardioTreaning {
  int? id;
  final DateTime date;
  final int duration;
  final CardioExercise exercise;
  final double length;

  DateTime? _finish;
  DateTime? _start;

  CardioTreaning({
    this.id,
    required this.date,
    required this.duration,
    required this.exercise,
    required this.length,
  });

  DateTime? get getFinish => _finish;

  bool get finished => _finish != null;
}
