import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_exercises_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SelectToUseStrengthExercise {
  final StrengthExerciseRepository strengthExerciseRepository;
  SelectToUseStrengthExercise({
    required this.strengthExerciseRepository,
  });

  Future<Either<Failure, Unit>> call({
    required StrengthExercise exercise,
    required bool select,
  }) async {
    return await strengthExerciseRepository.selectToUse(
        exercise: exercise, select: select);
  }
}
