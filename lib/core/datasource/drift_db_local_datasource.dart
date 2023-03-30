import 'dart:io';

import 'package:climbing_diary/core/datasource/db_tables.dart';
import 'package:climbing_diary/core/datasource/local_db_datasource.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_db_local_datasource.g.dart';
part 'drift_db_tables.dart';

// @LazySingleton(as: LocalDBDatasource)
@LazySingleton()
@DriftDatabase(
  tables: tables,
)
class DriftDBLocalDataSource extends _$DriftDBLocalDataSource
    implements LocalDBDatasource {
  DriftDBLocalDataSource() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
            // ..where((tbl) {
            //   // final List<Expression<bool>> conditions = [];
            //   for (var key in whereConditions!.keys) {
            //     final column = tbl.columnsByName[key];
            //     if (column != null) {
            //       return column.equals(whereConditions[key]);
            //     }
            //   }
            //   throw 'Неизвестное условие';
            // })
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
      (driftTable) {
        // try {
        //   driftTable.insertAll(
        //       data
        //           .map((dataItem) => DriftRecipeItem.fromJson(dataItem))
        //           .toList(),
        //       mode: InsertMode.insertOrReplace);
        // } catch (error) {
        //   return Left(DataBaseFailure(description: 'Drift DB: $error'));
        // }

        return const Right(unit);
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

      default:
        return Left(DataBaseFailure(
            description: 'Drift DB - неизвестная таблица: $table'));
    }
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
                // ..orderBy(
                //   [
                //     (u) => OrderingTerm(
                //         expression: table..,
                //         mode: OrderingMode.desc)
                //   ],
                // )
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

    default:
      return throw 'Drift DB - неизвестная таблица: $table';
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
