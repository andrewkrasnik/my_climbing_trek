import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:dartz/dartz.dart';

abstract class StrengthExerciseDataSource {
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

// @LazySingleton(as: StrengthExerciseDataSource)
class MockStrengthExerciseDataSource implements StrengthExerciseDataSource {
  final List<StrengthExercise> _exercises = [];
  final Map<StrengthExercise, bool> _selected = {};

  @override
  Future<Either<Failure, List<StrengthExercise>>> getExercises() async {
    return Right(_exercises);
  }

  @override
  Future<Either<Failure, StrengthExercise>> saveExercise(
      {required StrengthExercise exercise}) async {
    final index = _exercises.indexWhere((element) => element.id == exercise.id);

    if (index == -1) {
      _exercises.add(exercise);
    } else {
      _exercises[index] = exercise;
    }

    return Right(exercise);
  }

  @override
  Future<Either<Failure, Map<StrengthExercise, bool>>> getSelected() async {
    return Right(_selected);
  }

  @override
  Future<Either<Failure, Unit>> selectToUse(
      {required StrengthExercise exercise, required bool select}) async {
    if (select) {
      _selected[exercise] = true;
    } else {
      _selected.remove(exercise);
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteExercise(
      {required StrengthExercise exercise}) async {
    _exercises.remove(exercise);
    _selected.remove(exercise);
    return const Right(unit);
  }
}
