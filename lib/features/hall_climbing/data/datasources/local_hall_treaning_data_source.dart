import 'dart:ffi';
import 'dart:io';

import 'package:climbing_diary/core/data/ascent_type.dart';
import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/data/datasources/hall_treaning_data_source.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'local_hall_treaning_data_source.g.dart';

@LazySingleton(as: HallTreaningDataSource)
class LocalHallTreaningDataSource implements HallTreaningDataSource {
  final LocalDatabase localDatabase;
  LocalHallTreaningDataSource({
    required this.localDatabase,
  });
  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings() async {
    final rawTreanings = await localDatabase.getAllTreanings();
    final List<ClimbingHallTreaning> treanings = [];
    for (var element in rawTreanings) {
      treanings.add(await _itemToTreaning(element));
    }
    return Right(treanings);
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> currentTreaning() async {
    final treaning =
        await (localDatabase.select(localDatabase.hallTreaningTable)
              ..where((tbl) => tbl.finish.equalsNullable(null)))
            .getSingleOrNull();

    if (treaning != null) {
      return Right(await _itemToTreaning(treaning));
    } else {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> lastTreaning() async {
    final treaning =
        await (localDatabase.select(localDatabase.hallTreaningTable)
              ..orderBy(
                [
                  (u) =>
                      OrderingTerm(expression: u.date, mode: OrderingMode.desc)
                ],
              )
              ..where((tbl) => tbl.finish.isNotNull())
              ..limit(1))
            .getSingleOrNull();

    if (treaning != null) {
      return Right(await _itemToTreaning(treaning));
    } else {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> saveTreaning(
      {required ClimbingHallTreaning treaning}) async {
    if (treaning.isNew) {
      final int id =
          await localDatabase.into(localDatabase.hallTreaningTable).insert(
                HallTreaningTableCompanion.insert(
                  hallId: treaning.climbingHall.id,
                  date: treaning.date,
                  finish: Value(treaning.getFinish),
                ),
              );

      treaning.id = id;
    } else {
      await localDatabase
          .into(localDatabase.hallTreaningTable)
          .insertOnConflictUpdate(
            HallTreaningTableCompanion.insert(
              id: Value(treaning.id!),
              hallId: treaning.climbingHall.id,
              date: treaning.date,
              finish: Value(treaning.getFinish),
            ),
          );
    }
    return Right(treaning);
  }

  @override
  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt(
      {required ClimbingHallTreaning treaning,
      required ClimbingHallAttempt attempt}) async {
    if (attempt.id == null) {
      final int id = await localDatabase
          .into(localDatabase.hallAttemptTable)
          .insert(HallAttemptTableCompanion.insert(
            treaningId: treaning.id!,
            categoryId: attempt.category.id,
            styleId: attempt.style.id,
            routeId: Value(attempt.route?.id),
            suspensionCount: attempt.suspensionCount,
            fallCount: attempt.fallCount,
            downClimbing: attempt.downClimbing,
            fail: attempt.fail,
            start: Value(attempt.startTime),
            finish: Value(attempt.finishTime),
            ascentTypeId: Value(attempt.ascentType?.id),
          ));

      attempt.id = id;
    } else {
      await localDatabase
          .into(localDatabase.hallAttemptTable)
          .insertOnConflictUpdate(HallAttemptTableCompanion.insert(
            id: Value(attempt.id!),
            treaningId: treaning.id!,
            categoryId: attempt.category.id,
            styleId: attempt.style.id,
            routeId: Value(attempt.route?.id),
            suspensionCount: attempt.suspensionCount,
            fallCount: attempt.fallCount,
            downClimbing: attempt.downClimbing,
            fail: attempt.fail,
            start: Value(attempt.startTime),
            finish: Value(attempt.finishTime),
            ascentTypeId: Value(attempt.ascentType?.id),
          ));
    }
    return Right(attempt);
  }

  Future<List<ClimbingHallAttempt>> _treaningAttempts({
    required int hallId,
    required int treaningId,
  }) async {
    final data = await (localDatabase.select(localDatabase.hallAttemptTable)
          ..where((tbl) => tbl.treaningId.equals(treaningId)))
        .get();

    final List<ClimbingHallAttempt> attempts = [];

    for (var element in data) {
      attempts.add(await _itemToAttempt(item: element, hallId: hallId));
    }

    return attempts;
  }

  Future<ClimbingHallAttempt> _itemToAttempt({
    required HallAttemptItem item,
    required int hallId,
  }) async {
    final ClimbingHallRoute? route;

    if (item.routeId != null) {
      final failureOrRoute = await getIt<ClimbingHallDataSource>()
          .getRouteById(id: item.routeId!, hallId: hallId);

      route = failureOrRoute.fold((l) => null, (route) => route);
    } else {
      route = null;
    }

    final attempt = ClimbingHallAttempt(
      category: ClimbingCategory.getById(item.categoryId),
      style: ClimbingStyle.getById(item.styleId),
      id: item.id,
      route: route,
    );

    attempt.ascentType = item.ascentTypeId == null
        ? null
        : AscentType.getById(item.ascentTypeId!);

    attempt.downClimbing = item.downClimbing;
    attempt.startTime = item.start;
    attempt.finishTime = item.finish;
    attempt.fail = item.fail;
    attempt.fallCount = item.fallCount;
    attempt.suspensionCount = item.suspensionCount;

    return attempt;
  }

  Future<ClimbingHallTreaning> _itemToTreaning(HallTreaningItem item) async {
    final failureOrHall =
        await getIt<ClimbingHallDataSource>().getHallById(item.hallId);

    final attempts =
        await _treaningAttempts(hallId: item.hallId, treaningId: item.id);
    return ClimbingHallTreaning(
        id: item.id,
        climbingHall: failureOrHall.getOrElse(
          () => throw 'error',
        ),
        attempts: attempts,
        date: item.date);
  }

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required ClimbingHallAttempt attempt}) async {
    await (localDatabase.delete(localDatabase.hallAttemptTable)
          ..where((tbl) => tbl.id.equals(attempt.id!)))
        .go();

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning}) async {
    await (localDatabase.delete(localDatabase.hallAttemptTable)
          ..where((tbl) => tbl.treaningId.equals(treaning.id!)))
        .go();
    await (localDatabase.delete(localDatabase.hallTreaningTable)
          ..where((tbl) => tbl.id.equals(treaning.id!)))
        .go();

    return const Right(unit);
  }
}

@DataClassName('HallTreaningItem')
class HallTreaningTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get hallId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
}

@DataClassName('HallAttemptItem')
class HallAttemptTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get treaningId => integer().references(HallTreaningTable, #id)();
  IntColumn get categoryId => integer()();
  IntColumn get styleId => integer()();
  IntColumn get routeId => integer().nullable()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  IntColumn get ascentTypeId => integer().nullable()();
  IntColumn get suspensionCount => integer()();
  IntColumn get fallCount => integer()();
  BoolColumn get downClimbing => boolean()();
  BoolColumn get fail => boolean()();
}

@LazySingleton()
@DriftDatabase(
  tables: [
    HallTreaningTable,
    HallAttemptTable,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<HallTreaningItem>> getAllTreanings() async =>
      (select(hallTreaningTable)
            ..orderBy(
              [
                (u) => OrderingTerm(expression: u.date, mode: OrderingMode.desc)
              ],
            ))
          .get();

  Future<int> insertTreaning(HallTreaningItem item) async {
    return await hallTreaningTable.insertOne(item, mode: InsertMode.insert);
  }
}

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
