import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_treanings_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_treaning_model.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';

@LazySingleton(as: IceTreaningsDataSource)
class LocalIceTreaningsDataSource implements IceTreaningsDataSource {
  final LocalDBDatasource _localDatabase;
  final table = DBTables.iceTreanings;
  final attemptsTable = DBTables.iceAttempts;

  LocalIceTreaningsDataSource(this._localDatabase);

  @override
  Future<Either<Failure, IceTreaning?>> getCurrentTreaning() async {
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
  Future<Either<Failure, IceTreaning?>> getPreviousTreaning() async {
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
  Future<Either<Failure, List<IceTreaning>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<IceTreaning> treanings = [];

        for (var treaning in data) {
          treanings.add(await _treaningWithAttempts(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning}) async {
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
  Future<Either<Failure, Unit>> deleteTreaning(
      {required IceTreaning treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: attemptsTable, whereConditions: {'treaning_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: _convertTreaning(treaning: treaning)),
    );
  }

  Future<IceTreaningModel> _treaningWithAttempts(
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

    return IceTreaningModel.fromJson(json);
  }

  Map<String, dynamic> _convertTreaning({required IceTreaning treaning}) {
    if (treaning is IceTreaningModel) {
      return treaning.toJson();
    } else {
      return IceTreaningModel(
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

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required IceTreaningAttempt attempt}) async {
    return await _localDatabase.deleteById(
        table: attemptsTable,
        data: const IceTreaningAttemptConverter().toJson(attempt));
  }
}
