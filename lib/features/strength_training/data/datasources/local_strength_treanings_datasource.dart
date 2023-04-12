import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/data/datasources/strength_exercise_datasource.dart';
import 'package:my_climbing_trek/features/strength_training/data/datasources/strength_treanings_datasource.dart';
import 'package:my_climbing_trek/features/strength_training/data/models/strength_treaning_model.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StrengthTreaningsDataSource)
class LocalStrengthTreaningsDataSource implements StrengthTreaningsDataSource {
  final LocalDBDatasource _localDatabase;

  final table = DBTables.strengthTreanings;
  final linesTable = DBTables.strengthLines;

  Map<String, StrengthExercise>? _exercises;

  LocalStrengthTreaningsDataSource(this._localDatabase);

  @override
  Future<Either<Failure, StrengthTreaning?>> currentTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getCurrentTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithLines(json));
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required StrengthTreaning treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: linesTable, whereConditions: {'treaning_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: _convertTreaning(treaning: treaning)),
    );
  }

  @override
  Future<Either<Failure, List<StrengthTreaning>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<StrengthTreaning> treanings = [];

        for (var treaning in data) {
          treanings.add(await _treaningWithLines(treaning));
        }

        return Right(treanings);
      },
    );
  }

  Future<StrengthTreaningModel> _treaningWithLines(json) async {
    final failureOrLines = await _localDatabase.getData(
      table: linesTable,
      whereConditions: {'treaning_id': json['id']},
      orderByConditions: {'exercise': false},
    );

    if (_exercises == null) {
      final failureOrList =
          await getIt<StrengthExerciseDataSource>().getExercises();

      failureOrList.fold((_) => null, (list) {
        _exercises = {for (final item in list) item.id: item};
      });
    }

    json['attempts'] = failureOrLines.fold(
      (l) => [],
      (lines) => lines,
    );

    return StrengthTreaningModel.fromJson(json);
  }

  @override
  Future<Either<Failure, StrengthTreaning?>> previosTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getLastTreaning(table: table);

    return failureOrTreaning.fold(
      (failure) => Left(failure),
      (json) async {
        if (json == null) {
          return const Right(null);
        } else {
          return Right(await _treaningWithLines(json));
        }
      },
    );
  }

  @override
  Future<Either<Failure, StrengthTreaning>> saveTreaning(
      {required StrengthTreaning treaning}) async {
    final data = _convertTreaning(treaning: treaning);
    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit.fold((failure) => Left(failure), (_) async {
      final failureOrUnitDelete = await _localDatabase.deleteAll(
          table: linesTable, whereConditions: {'treaning_id': treaning.id});

      return failureOrUnitDelete.fold(
        (failure) => Left(failure),
        (_) async {
          if (treaning.attempts.isNotEmpty) {
            final failureOrUnitInsert = await _localDatabase.insertAll(
                table: linesTable, data: data['attempts']);
            return failureOrUnitInsert.fold(
                (failure) => Left(failure), (r) => Right(treaning));
          } else {
            return Right(treaning);
          }
        },
      );
    });
  }

  Map<String, dynamic> _convertTreaning({required StrengthTreaning treaning}) {
    if (treaning is StrengthTreaningModel) {
      return treaning.toJson();
    } else {
      return StrengthTreaningModel(
        date: treaning.date,
        finish: treaning.finish,
        start: treaning.start,
        id: treaning.id,
        attempts: treaning.attempts,
      ).toJson();
    }
  }
}
