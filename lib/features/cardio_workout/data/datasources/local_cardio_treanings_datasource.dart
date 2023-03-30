import 'package:climbing_diary/core/datasource/db_tables.dart';
import 'package:climbing_diary/core/datasource/drift_db_local_datasource.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/data/datasources/cardio_treanings_datasource.dart';
import 'package:climbing_diary/features/cardio_workout/data/models/cardio_treaning_model.dart';
import 'package:dartz/dartz.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardioTreaningsDatasource)
class LocalCardioTreaningsDatasource implements CardioTreaningsDatasource {
  final DriftDBLocalDataSource _localDatabase;

  final table = DBTables.cardioTreanings;

  LocalCardioTreaningsDatasource(this._localDatabase);

  @override
  Future<Either<Failure, Unit>> delete(
      {required CardioTreaning treaning}) async {
    return await _localDatabase.deleteById(
        table: table, data: _convertTreaning(treaning: treaning));
  }

  @override
  Future<Either<Failure, List<CardioTreaning>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) => Right(
          data.map((json) => CardioTreaningModel.fromJson(json)).toList()),
    );
  }

  @override
  Future<Either<Failure, CardioTreaning?>> lastTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getLastTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(CardioTreaningModel.fromJson(json));
      }
    });
  }

  @override
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning}) async {
    final failureOrUnit = await _localDatabase.updateById(
        table: table, data: _convertTreaning(treaning: treaning));

    return failureOrUnit.fold(
        (failure) => Left(failure), (_) => Right(treaning));
  }

  Map<String, dynamic> _convertTreaning({required CardioTreaning treaning}) {
    if (treaning is CardioTreaningModel) {
      return treaning.toJson();
    } else {
      return CardioTreaningModel(
        date: treaning.date,
        duration: treaning.duration,
        exercise: treaning.exercise,
        length: treaning.length,
        finish: treaning.finish,
        start: treaning.start,
        id: treaning.id,
      ).toJson();
    }
  }
}
