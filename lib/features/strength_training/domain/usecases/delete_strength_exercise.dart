import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_exercises_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteStrengthExercise {
  final StrengthExerciseRepository strengthExerciseRepository;
  DeleteStrengthExercise({
    required this.strengthExerciseRepository,
  });

  Future<Either<Failure, Unit>> call({
    required StrengthExercise exercise,
  }) async {
    return await strengthExerciseRepository.deleteExercise(exercise: exercise);
  }
}
