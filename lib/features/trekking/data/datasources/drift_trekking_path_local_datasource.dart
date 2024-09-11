import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_path_local_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trekking_path_model.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';

@LazySingleton(as: TrekkingPathLocalDataSource)
class DriftTrekkingPathLocalDataSource implements TrekkingPathLocalDataSource {
  final LocalDBDatasource _localDatabase;
  final table = DBTables.trekkingPaths;
  final eventsTable = DBTables.trekkingPathEvents;

  DriftTrekkingPathLocalDataSource(this._localDatabase);

  @override
  Future<Either<Failure, TrekkingPath?>> currentPath() async {
    final failureOrTreaning =
        await _localDatabase.getCurrentTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _pathWithEvents(json));
      }
    });
  }

  @override
  Future<Either<Failure, TrekkingPath?>> previosPath() async {
    final failureOrTreaning =
        await _localDatabase.getLastTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null || json['currentSection'] == null) {
        return const Right(null);
      } else {
        return Right(await _pathWithEvents(json));
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> savePath({required TrekkingPath path}) async {
    final data = const TrekkingPathConverter().toJson(path);

    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit;

    // return failureOrUnit.fold((failure) => Left(failure), (_) async {
    //   final failureOrUnitDelete = await _localDatabase
    //       .deleteAll(table: eventsTable, whereConditions: {'path_id': path.id});

    //   return failureOrUnitDelete.fold(
    //     (failure) => Left(failure),
    //     (_) async {
    //       final failureOrUnitInsert = await _localDatabase.insertAll(
    //           table: eventsTable, data: data['events']);
    //       return failureOrUnitInsert.fold(
    //           (failure) => Left(failure), (r) => const Right(unit));
    //     },
    //   );
    // });
  }

  @override
  Future<Either<Failure, Unit>> savePathEvent(
      {required TrekkingPathEvent event}) async {
    final failureOrUnit = await _localDatabase.updateById(
      table: eventsTable,
      data: const TrekkingPathEventConverter().toJson(event),
    );

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (r) => const Right(unit),
    );
  }

  @override
  Future<Either<Failure, List<TrekkingPath>>> treanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<TrekkingPath> treanings = [];

        for (var treaning in data) {
          treanings.add(await _pathWithEvents(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TrekkingPath treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: eventsTable, whereConditions: {'path_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: const TrekkingPathConverter().toJson(treaning)),
    );
  }

  Future<TrekkingPathModel> _pathWithEvents(Map<String, dynamic> json) async {
    final failureOrLines = await _localDatabase.getData(
      table: eventsTable,
      whereConditions: {'path_id': json['id']},
      orderByConditions: {'time': false},
    );

    json['events'] = failureOrLines.fold(
      (l) => [],
      (lines) => lines,
    );

    return TrekkingPathModel.fromJson(json);
  }

  @override
  Future<Either<Failure, TrekkingPath>> getPath(
      {required String pathId}) async {
    final failureOrData = await _localDatabase.getData(
      table: table,
      whereConditions: {'id': pathId},
      orderByConditions: {'date': false},
    );

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        return Right(await _pathWithEvents(data.first));
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deletePathEvent(
      {required TrekkingPathEvent event}) async {
    return await _localDatabase.deleteById(
      table: eventsTable,
      data: const TrekkingPathEventConverter().toJson(event),
    );
  }
}
