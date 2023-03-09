import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/data/datasources/strength_exercise_datasource.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_exercises_repository.dart';

@LazySingleton(as: StrengthExerciseRepository)
class StrengthExerciseRepositoryImpl implements StrengthExerciseRepository {
  final StrengthExerciseDataSource strengthExerciseDataSource;

  StrengthExerciseRepositoryImpl({
    required this.strengthExerciseDataSource,
  });

  @override
  Future<Either<Failure, List<StrengthExercise>>> getExercises() async {
    return await strengthExerciseDataSource.getExercises();
  }

  @override
  Future<Either<Failure, StrengthExercise>> saveExercise(
      {required StrengthExercise exercise}) async {
    return await strengthExerciseDataSource.saveExercise(exercise: exercise);
  }

  @override
  Future<Either<Failure, Map<StrengthExercise, bool>>> getSelected() async {
    return await strengthExerciseDataSource.getSelected();
  }

  @override
  Future<Either<Failure, Unit>> selectToUse(
      {required StrengthExercise exercise, required bool select}) async {
    return await strengthExerciseDataSource.selectToUse(
        exercise: exercise, select: select);
  }
}
