import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/local_ascension_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/ascension_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';

@LazySingleton(as: LocalAscensionDataSource)
class DriftLocalAscensionDataSource implements LocalAscensionDataSource {
  final LocalDBDatasource _localDatabase;
  final table = DBTables.ascensions;
  final eventsTable = DBTables.ascensionEvents;

  DriftLocalAscensionDataSource(this._localDatabase);

  @override
  Future<Either<Failure, Ascension?>> currentAscention() async {
    final failureOrTreaning =
        await _localDatabase.getCurrentTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _ascensionWithEvents(json));
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteAscention(
      {required Ascension ascension}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: eventsTable, whereConditions: {'ascension_id': ascension.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: const AscensionConverter().toJson(ascension)),
    );
  }

  @override
  Future<Either<Failure, List<Ascension>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<Ascension> treanings = [];

        for (var treaning in data) {
          treanings.add(await _ascensionWithEvents(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> saveAscention(
      {required Ascension ascension}) async {
    final data = const AscensionConverter().toJson(ascension);

    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, Unit>> saveAscentionEvent(
      {required AscensionEvent event}) async {
    final failureOrUnit = await _localDatabase.updateById(
      table: eventsTable,
      data: const AscensionEventConverter().toJson(event),
    );

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (r) => const Right(unit),
    );
  }

  Future<AscensionModel> _ascensionWithEvents(Map<String, dynamic> json) async {
    final failureOrLines = await _localDatabase.getData(
      table: eventsTable,
      whereConditions: {'ascension_id': json['id']},
      orderByConditions: {'time': false},
    );

    json['events'] = failureOrLines.fold(
      (l) => [],
      (lines) => lines,
    );

    return AscensionModel.fromJson(json);
  }

  @override
  Future<Either<Failure, Ascension>> getAscention({required String id}) async {
    final failureOrData = await _localDatabase.getData(
      table: table,
      whereConditions: {'id': id},
      orderByConditions: {'date': false},
    );

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        return Right(await _ascensionWithEvents(data.first));
      },
    );
  }
}
