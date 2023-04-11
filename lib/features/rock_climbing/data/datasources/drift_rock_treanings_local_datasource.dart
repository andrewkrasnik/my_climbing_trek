import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/drift_db_local_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_treaning_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/service_locator.dart';

@LazySingleton(as: RockTreaningsLocalDataSource)
class DriftRockTreaningsLocalDataSource
    implements RockTreaningsLocalDataSource {
  final DriftDBLocalDataSource _localDatabase;
  final table = DBTables.rockTreanings;
  final attemptsTable = DBTables.rockAttempts;

  DriftRockTreaningsLocalDataSource(this._localDatabase);

  @override
  Future<Either<Failure, RockTreaning>> saveTreaning(
      {required RockTreaning treaning}) async {
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
  Future<Either<Failure, List<RockTreaning>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<RockTreaning> treanings = [];

        for (var treaning in data) {
          treanings.add(await _treaningWithAttempts(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, RockTreaning?>> getCurrentTreaning() async {
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
  Future<Either<Failure, RockTreaning?>> getPreviousTreaning() async {
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
  Future<Either<Failure, Unit>> deleteTreaning(
      {required RockTreaning treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: attemptsTable, whereConditions: {'treaning_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: _convertTreaning(treaning: treaning)),
    );
  }

  Future<RockTreaningModel> _treaningWithAttempts(
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

    return RockTreaningModel.fromJson(json);
  }

  Map<String, dynamic> _convertTreaning({required RockTreaning treaning}) {
    if (treaning is RockTreaningModel) {
      return treaning.toJson();
    } else {
      return RockTreaningModel(
        date: treaning.date,
        finish: treaning.finish,
        start: treaning.start,
        id: treaning.id,
        district: treaning.district,
        attempts: treaning.attempts,
        sectors: treaning.sectors,
      ).toJson();
    }
  }
}
