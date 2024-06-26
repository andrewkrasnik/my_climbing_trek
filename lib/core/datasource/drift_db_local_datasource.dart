import 'dart:io';

import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_db_local_datasource.g.dart';
part 'drift_db_tables.dart';

@LazySingleton(as: LocalDBDatasource)
@LazySingleton()
@DriftDatabase(
  tables: tables,
)
class DriftDBLocalDataSource extends _$DriftDBLocalDataSource
    implements LocalDBDatasource {
  DriftDBLocalDataSource() : super(_openConnection());

  @override
  int get schemaVersion => 19;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // we added the dueDate property in the change from version 1 to
          // version 2
          await m.createTable(driftStrengthExercisesTable);
        }
        if (from < 3) {
          // we added the priority property in the change from version 1 or 2
          // to version 3

          await m.renameTable(driftHallTreaningsTable, 'hall_treaning_table');
          await m.renameTable(driftHallAttemptsTable, 'hall_attempt_table');
        }
        if (from < 4) {
          // await m.addColumn(driftStrengthExercisesTable,
          //     driftStrengthExercisesTable.selected);
        }
        if (from < 5) {
          // we added the dueDate property in the change from version 1 to
          // version 2
          await m.createTable(driftStrengthTreaningLinesTable);
          await m.createTable(driftStrengthTreaningsTable);
          await m.createTable(driftCardioTreaningsTable);
        }
        if (from < 7) {
          await m.deleteTable(driftStrengthTreaningLinesTable.actualTableName);
          await m.createTable(driftStrengthTreaningLinesTable);
        }
        if (from < 8) {
          await m.createTable(driftIceTreaningsTable);
          await m.createTable(driftIceAttemptsTable);
        }
        if (from < 9) {
          await m.createTable(driftRockTreaningsTable);
          await m.createTable(driftRockAttemptsTable);
        }
        if (from < 10) {
          await m.addColumn(
              driftIceTreaningsTable, driftIceTreaningsTable.district);
          await m.addColumn(
              driftIceAttemptsTable, driftIceAttemptsTable.sectorId);
        }
        if (from < 11) {
          await m.addColumn(
              driftIceTreaningsTable, driftIceTreaningsTable.sectors);
        }
        if (from < 12) {
          await m.addColumn(
              driftRockTreaningsTable, driftRockTreaningsTable.sectors);
        }
        if (from < 13) {
          await m.addColumn(driftStrengthTreaningLinesTable,
              driftStrengthTreaningLinesTable.exerciseId);
        }
        if (from < 14) {
          await m.deleteTable(driftHallTreaningsTable.actualTableName);
          await m.createTable(driftHallTreaningsTable);
        }
        if (from < 15) {
          await m.addColumn(
              driftRockAttemptsTable, driftRockAttemptsTable.ascentType);
        }
        if (from < 16) {
          await m.createTable(driftTrekkingPathsTable);
          await m.createTable(driftTrekkingPathEventsTable);
        }
        if (from < 17) {
          await m.createTable(driftTechniqueTreaningsTable);
          await m.createTable(driftTechniqueTreaningItemsTable);
        }
        if (from < 18) {
          await m.createTable(driftAscensionsTable);
          await m.createTable(driftAscensionEventsTable);
        }
        if (from < 19) {
          await m.createTable(driftTravelsTable);
          await m.createTable(driftTravelDaysTable);
          await m.createTable(driftCostLinesTable);
          await m.createTable(driftBudgetLinesTable);
          await m.createTable(driftInsuranceLinesTable);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getData({
    required DBTables table,
    Map<String, dynamic>? whereConditions,
    Map<String, bool>? orderByConditions,
  }) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold((failure) => Left(failure), (driftTable) async {
      final List<DataClass> data = await (select(driftTable)
            ..where((tbl) {
              if (whereConditions == null) {
                return const Constant(true);
              }
              final List<Expression<bool>> conditions = [];
              for (var key in whereConditions.keys) {
                final column = driftTable.columnsByName[key];
                if (column != null) {
                  conditions.add(column.equals(whereConditions[key]));
                } else {
                  throw 'Неизвестная колонка: $key';
                }
              }

              return Expression.and(conditions);
            })
            ..orderBy(orderByConditions!.keys
                .map(
                  (key) => (tbl) => OrderingTerm(
                        expression: tbl.columnsByName[key]!,
                        mode: orderByConditions[key] == true
                            ? OrderingMode.desc
                            : OrderingMode.asc,
                      ),
                )
                .toList()))
          .get();
      // data as List<Map<String, dynamic>>;
      return Right(data.map((dataItem) => dataItem.toJson()).toList());
    });
  }

  @override
  Future<Either<Failure, Unit>> insertAll(
      {required DBTables table,
      required List<Map<String, dynamic>> data}) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold(
      (failure) => Left(failure),
      (driftTable) async {
        try {
          for (var dataItem in data) {
            await driftTable.insertOnConflictUpdate(
                _dataClassFromJson(json: dataItem, table: table));
          }
        } catch (error) {
          return Left(DataBaseFailure(description: 'Drift DB: $error'));
        }

        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteById(
      {required DBTables table, required Map<String, dynamic> data}) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold(
      (failure) => Left(failure),
      (driftTable) {
        try {
          final id = data['id'];

          if (id != null) {
            try {
              driftTable
                  .deleteOne(_dataClassFromJson(json: data, table: table));
            } catch (error) {
              return Left(DataBaseFailure(description: 'Drift DB: $error'));
            }
          } else {
            return Left(
                DataBaseFailure(description: 'Данные не содержат id элемента'));
          }
        } catch (error) {
          return Left(DataBaseFailure(description: 'Drift DB: $error'));
        }

        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateById(
      {required DBTables table, required Map<String, dynamic> data}) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold(
      (failure) => Left(failure),
      (driftTable) {
        try {
          final id = data['id'];

          if (id != null) {
            try {
              driftTable.insertOne(_dataClassFromJson(json: data, table: table),
                  mode: InsertMode.insertOrReplace);
            } catch (error) {
              return Left(DataBaseFailure(description: 'Drift DB: $error'));
            }
          } else {
            return Left(
                DataBaseFailure(description: 'Данные не содержат id элемента'));
          }
        } catch (error) {
          return Left(DataBaseFailure(description: 'Drift DB: $error'));
        }

        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> getCurrentTreaning(
      {required DBTables table}) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold(
      (failure) => Left(failure),
      (driftTable) async {
        try {
          final finishColumn = driftTable.columnsByName['finish'];
          final treaning = await (select(driftTable)
                ..where((tbl) => finishColumn!.equalsNullable(null)))
              .getSingleOrNull();

          return Right(treaning?.toJson());
        } catch (error) {
          return Left(DataBaseFailure(description: 'Drift DB: $error'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> getLastTreaning(
      {required DBTables table}) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold(
      (failure) => Left(failure),
      (driftTable) async {
        try {
          final finishColumn = driftTable.columnsByName['finish'];
          final treaning = await (select(driftTable)
                ..orderBy(
                  [
                    (tbl) => OrderingTerm(
                        expression: finishColumn!, mode: OrderingMode.desc)
                  ],
                )
                ..where((tbl) => finishColumn!.isNotNull())
                ..limit(1))
              .getSingleOrNull();

          return Right(treaning?.toJson());
        } catch (error) {
          return Left(DataBaseFailure(description: 'Drift DB: $error'));
        }
      },
    );
  }

  Either<Failure, TableInfo<Table, DataClass>> _getTable(DBTables table) {
    switch (table) {
      case DBTables.strengthExercises:
        return Right(driftStrengthExercisesTable);

      case DBTables.hallAttempts:
        return Right(driftHallAttemptsTable);

      case DBTables.hallTreanings:
        return Right(driftHallTreaningsTable);

      case DBTables.cardioTreanings:
        return Right(driftCardioTreaningsTable);

      case DBTables.strengthLines:
        return Right(driftStrengthTreaningLinesTable);

      case DBTables.strengthTreanings:
        return Right(driftStrengthTreaningsTable);

      case DBTables.iceAttempts:
        return Right(driftIceAttemptsTable);

      case DBTables.iceTreanings:
        return Right(driftIceTreaningsTable);

      case DBTables.rockAttempts:
        return Right(driftRockAttemptsTable);

      case DBTables.rockTreanings:
        return Right(driftRockTreaningsTable);

      case DBTables.trekkingPaths:
        return Right(driftTrekkingPathsTable);

      case DBTables.trekkingPathEvents:
        return Right(driftTrekkingPathEventsTable);

      case DBTables.techniqueTreanings:
        return Right(driftTechniqueTreaningsTable);

      case DBTables.techniqueTreaningsItems:
        return Right(driftTechniqueTreaningItemsTable);

      case DBTables.ascensions:
        return Right(driftAscensionsTable);

      case DBTables.ascensionEvents:
        return Right(driftAscensionEventsTable);

      case DBTables.travels:
        return Right(driftTravelsTable);

      case DBTables.travelDays:
        return Right(driftTravelDaysTable);

      case DBTables.travelCosts:
        return Right(driftCostLinesTable);

      case DBTables.travelInsurance:
        return Right(driftInsuranceLinesTable);

      case DBTables.travelBudget:
        return Right(driftBudgetLinesTable);

      default:
        return Left(DataBaseFailure(
            description: 'Drift DB - неизвестная таблица: $table'));
    }
  }

  Insertable<DataClass> _dataClassFromJson(
      {required DBTables table, required Map<String, dynamic> json}) {
    switch (table) {
      case DBTables.strengthExercises:
        return DriftStrengthExercise.fromJson(json);

      case DBTables.hallAttempts:
        return DriftHallAttempt.fromJson(json);

      case DBTables.hallTreanings:
        return DriftHallTreaning.fromJson(json);

      case DBTables.cardioTreanings:
        return DriftCardioTreanings.fromJson(json);

      case DBTables.strengthLines:
        return DriftStrengthTreaningLine.fromJson(json);

      case DBTables.strengthTreanings:
        return DriftStrengthTreaning.fromJson(json);

      case DBTables.iceAttempts:
        return DriftIceAttempt.fromJson(json);

      case DBTables.iceTreanings:
        return DriftIceTreanings.fromJson(json);

      case DBTables.rockAttempts:
        return DriftRockAttempt.fromJson(json);

      case DBTables.rockTreanings:
        return DriftRockTreanings.fromJson(json);

      case DBTables.trekkingPaths:
        return DriftTrekkingPath.fromJson(json);

      case DBTables.trekkingPathEvents:
        return DriftTrekkingPathEvent.fromJson(json);

      case DBTables.techniqueTreanings:
        return DriftTechniqueTreaning.fromJson(json);

      case DBTables.techniqueTreaningsItems:
        return DriftTechniqueTreaningItem.fromJson(json);

      case DBTables.ascensions:
        return DriftAscension.fromJson(json);

      case DBTables.ascensionEvents:
        return DriftAscensionEvent.fromJson(json);

      case DBTables.travels:
        return DriftTravel.fromJson(json);

      case DBTables.travelDays:
        return DriftTravelDay.fromJson(json);

      case DBTables.travelCosts:
        return DriftCostLine.fromJson(json);

      case DBTables.travelInsurance:
        return DriftInsuranceLine.fromJson(json);

      case DBTables.travelBudget:
        return DriftBudgetLine.fromJson(json);

      default:
        return throw 'Drift DB - неизвестная таблица: $table';
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAll(
      {required DBTables table, Map<String, dynamic>? whereConditions}) async {
    final failureOrTable = _getTable(table);

    return failureOrTable.fold(
      (failure) => Left(failure),
      (driftTable) {
        try {
          driftTable.deleteWhere((tbl) {
            if (whereConditions == null) {
              return const Constant(true);
            }
            // final List<Expression<bool>> conditions = [];
            for (var key in whereConditions.keys) {
              final column = driftTable.columnsByName[key];
              if (column != null) {
                return column.equals(whereConditions[key]);
              }
            }
            throw 'Неизвестное условие';
          });
        } catch (error) {
          return Left(DataBaseFailure(description: 'Drift DB: $error'));
        }

        return const Right(unit);
      },
    );
  }
}

// Map<String, dynamic > _dataClassToJson(required DBTables table,)

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
