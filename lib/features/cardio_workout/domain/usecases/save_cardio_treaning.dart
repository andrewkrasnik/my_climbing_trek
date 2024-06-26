import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_exercise.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveCardioTreaning {
  final CardioTreaningsRepository cardioTreaningsRepository;
  SaveCardioTreaning({
    required this.cardioTreaningsRepository,
  });

  Future<Either<Failure, CardioTreaning>> call({
    String id = '',
    required DateTime date,
    required int duration,
    required CardioExercise exercise,
    required double length,
  }) async {
    final treaning = CardioTreaning(
      date: date,
      duration: duration,
      exercise: exercise,
      length: length,
      id: id,
    );

    treaning.finishTreaning();

    return await cardioTreaningsRepository.save(treaning: treaning);
  }
}
