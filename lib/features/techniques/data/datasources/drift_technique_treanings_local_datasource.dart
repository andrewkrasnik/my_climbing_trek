import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/technique_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/techniques/data/models/converters.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_treaning_model.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';

@LazySingleton(as: TechniqueTreaningsLocalDataSource)
class DriftTechniqueTreaningsLocalDataSource
    implements TechniqueTreaningsLocalDataSource {
  final LocalDBDatasource _localDatabase;

  final table = DBTables.techniqueTreanings;

  final itemsTable = DBTables.techniqueTreaningsItems;

  DriftTechniqueTreaningsLocalDataSource(this._localDatabase);

  @override
  Future<Either<Failure, List<TechniqueTreaning>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<TechniqueTreaning> treanings = [];

        for (var treaning in data) {
          treanings.add(await _treaningWithItems(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TechniqueTreaning treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: itemsTable, whereConditions: {'treaning_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table,
          data: const TechniqueTreaningConverter().toJson(treaning)),
    );
  }

  @override
  Future<Either<Failure, Unit>> saveTreaning(
      {required TechniqueTreaning treaning}) async {
    final data = const TechniqueTreaningConverter().toJson(treaning);

    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, Unit>> saveTreaningItem({
    required TechniqueTreaningItem item,
  }) async {
    final data = const TechniqueTreaningItemConverter().toJson(item);

    final failureOrUnit =
        await _localDatabase.updateById(table: itemsTable, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> currentTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getCurrentTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithItems(json));
      }
    });
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> previosTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getLastTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithItems(json));
      }
    });
  }

  Future<TechniqueTreaningModel> _treaningWithItems(
      Map<String, dynamic> json) async {
    final failureOrLines = await _localDatabase.getData(
      table: itemsTable,
      whereConditions: {'treaning_id': json['id']},
      orderByConditions: {'start_time': false},
    );

    json['items'] = failureOrLines.fold(
      (l) => [],
      (lines) => lines,
    );

    return TechniqueTreaningModel.fromJson(json);
  }
}
