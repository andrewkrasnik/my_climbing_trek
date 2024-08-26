import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_exercise.dart';

class CardioTreaning extends Treaning {
  final int duration;
  final CardioExercise exercise;
  final double length;

  @override
  bool get hasEditing => true;

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

  @override
  String get title => '${exercise.name} ${date.dayString()}';

  @override
  String get image =>
      'https://firebasestorage.googleapis.com/v0/b/my-climbing-trek.appspot.com/o/images%2Ftreanings%2Fcardio_treanings.jpg?alt=media&token=535ec616-7abf-42ee-a78d-d7f5ba076610';

  @override
  String get place => exercise.name;
}
