import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:dartz/dartz.dart';

abstract class StrengthExerciseRepository {
  Future<Either<Failure, List<StrengthExercise>>> getExercises();

  Future<Either<Failure, StrengthExercise>> saveExercise({
    required StrengthExercise exercise,
  });

  Future<Either<Failure, Unit>> selectToUse(
      {required StrengthExercise exercise, required bool select});

  Future<Either<Failure, Map<StrengthExercise, bool>>> getSelected();

  Future<Either<Failure, Unit>> deleteExercise(
      {required StrengthExercise exercise});
}
