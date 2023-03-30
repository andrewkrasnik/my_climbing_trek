import 'package:climbing_diary/core/datasource/db_tables.dart';
import 'package:climbing_diary/core/datasource/drift_db_local_datasource.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/data/datasources/strength_exercise_datasource.dart';
import 'package:climbing_diary/features/strength_training/data/models/strength_exercise_model.dart';
import 'package:dartz/dartz.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StrengthExerciseDataSource)
class LocalStrengthExerciseDataSource implements StrengthExerciseDataSource {
  final DriftDBLocalDataSource _localDatabase;

  final table = DBTables.strengthExercises;

  LocalStrengthExerciseDataSource(this._localDatabase);

  @override
  Future<Either<Failure, Unit>> deleteExercise(
      {required StrengthExercise exercise}) async {
    return await _localDatabase.deleteById(
        table: table, data: _convert(exercise: exercise));
  }

  @override
  Future<Either<Failure, List<StrengthExercise>>> getExercises() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'name': false});

    return failureOrData.fold((failure) => Left(failure), (data) {
      try {
        return Right(
            data.map((json) => StrengthExerciseModel.fromJson(json)).toList());
      } catch (error) {
        return Left(DataConvertionFailure(description: error.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, Map<StrengthExercise, bool>>> getSelected() async {
    final failureOrData = await _localDatabase.getData(
      table: table,
      whereConditions: {'selected': true},
      orderByConditions: {'name': false},
    );

    return failureOrData.fold((failure) => Left(failure), (data) {
      try {
        final iterable =
            data.map((json) => StrengthExerciseModel.fromJson(json));

        return Right({for (var element in iterable) element: true});
      } catch (error) {
        return Left(DataConvertionFailure(description: error.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, StrengthExercise>> saveExercise(
      {required StrengthExercise exercise}) async {
    final failureOrUnit = await _localDatabase.updateById(
        table: table, data: _convert(exercise: exercise));

    return failureOrUnit.fold(
        (failure) => Left(failure), (_) => Right(exercise));
  }

  @override
  Future<Either<Failure, Unit>> selectToUse(
      {required StrengthExercise exercise, required bool select}) async {
    return await _localDatabase.updateById(
        table: table, data: _convert(exercise: exercise, select: select));
  }

  Map<String, dynamic> _convert(
      {required StrengthExercise exercise, bool select = false}) {
    if (exercise is StrengthExerciseModel) {
      if (exercise.selected == select) {
        return exercise.toJson();
      } else {
        return exercise.copyWith(selected: select).toJson();
      }
    } else {
      return StrengthExerciseModel(
              selected: select,
              name: exercise.name,
              repetitions: exercise.repetitions,
              id: exercise.id)
          .toJson();
    }
  }
}
