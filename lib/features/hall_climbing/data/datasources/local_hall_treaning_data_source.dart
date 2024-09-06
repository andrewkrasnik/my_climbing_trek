import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_treaning_model.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/hall_treaning_data_source.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';

@LazySingleton(as: HallTreaningDataSource)
class LocalHallTreaningDataSource implements HallTreaningDataSource {
  final LocalDBDatasource _localDatabase;

  final table = DBTables.hallTreanings;
  final attemptsTable = DBTables.hallAttempts;

  LocalHallTreaningDataSource(
    this._localDatabase,
  );

  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<ClimbingHallTreaning> treanings = [];

        for (var treaning in data) {
          treanings.add(await _treaningWithAttempts(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning?>> currentTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getCurrentTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithAttempts(json));
      }
    });
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning?>> lastTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getLastTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithAttempts(json));
      }
    });
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> saveTreaning(
      {required ClimbingHallTreaning treaning}) async {
    final data = _convertTreaning(treaning: treaning);

    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit.fold((failure) => Left(failure), (_) async {
      final failureOrUnitDelete = await _localDatabase.deleteAll(
          table: attemptsTable, whereConditions: {'treaning_id': treaning.id});

      return failureOrUnitDelete.fold(
        (failure) => Left(failure),
        (_) async {
          final failureOrUnitInsert = await _localDatabase.insertAll(
              table: attemptsTable, data: data['attempts']);
          return failureOrUnitInsert.fold(
              (failure) => Left(failure), (r) => Right(treaning));
        },
      );
    });
  }

  @override
  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt(
      {required ClimbingHallTreaning treaning,
      required ClimbingHallAttempt attempt}) async {
    final failureOrUnit = await _localDatabase.updateById(
        table: attemptsTable, data: _convertAttempt(attempt: attempt));

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (r) => Right(attempt),
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required ClimbingHallAttempt attempt}) async {
    return await _localDatabase.deleteById(
        table: attemptsTable, data: _convertAttempt(attempt: attempt));
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: attemptsTable, whereConditions: {'treaning_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: _convertTreaning(treaning: treaning)),
    );
  }

  Future<HallTreaningModel> _treaningWithAttempts(
      Map<String, dynamic> json) async {
    final failureOrLines = await _localDatabase.getData(
      table: attemptsTable,
      whereConditions: {'treaning_id': json['id']},
      orderByConditions: {'start_time': false},
    );

    json['attempts'] = failureOrLines.fold(
      (l) => [],
      (lines) => lines,
    );

    return HallTreaningModel.fromJson(json);
  }

  Map<String, dynamic> _convertTreaning(
      {required ClimbingHallTreaning treaning}) {
    if (treaning is HallTreaningModel) {
      return treaning.toJson();
    } else {
      return HallTreaningModel(
        date: treaning.date,
        finish: treaning.finish,
        start: treaning.start,
        id: treaning.id,
        climbingHall: treaning.climbingHall,
        attempts: treaning.attempts,
      ).toJson();
    }
  }

  Map<String, dynamic> _convertAttempt({required ClimbingHallAttempt attempt}) {
    return const ClimbingHallAttemptConverter().toJson(attempt);
  }

  @override
  Future<Either<Failure, List<ClimbingHallAttempt>>> routeAttempts(
      {required ClimbingHallRoute route}) async {
    final failureOrLines = await _localDatabase.getData(
      table: attemptsTable,
      whereConditions: {'route_id': route.id},
      orderByConditions: {'start_time': true},
    );

    return failureOrLines.fold(
        (failure) => Left(failure),
        (lines) => Right(lines
            .map((line) => const ClimbingHallAttemptConverter().fromJson(line))
            .toList()));
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> getTreaning(
      {required String treaningId}) async {
    final failureOrData = await _localDatabase.getData(
      table: table,
      whereConditions: {'id': treaningId},
      orderByConditions: {'date': false},
    );

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        return Right(await _treaningWithAttempts(data.first));
      },
    );
  }
}
