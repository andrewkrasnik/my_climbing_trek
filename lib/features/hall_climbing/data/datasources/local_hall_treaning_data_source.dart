import 'dart:io';

import 'package:climbing_diary/core/data/ascent_type.dart';
import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/datasource/drift_db_local_datasource.dart';
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

@LazySingleton(as: HallTreaningDataSource)
class LocalHallTreaningDataSource implements HallTreaningDataSource {
  final DriftDBLocalDataSource localDatabase;
  LocalHallTreaningDataSource({
    required this.localDatabase,
  });
  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings() async {
    final rawTreanings = await _getAllTreanings();
    final List<ClimbingHallTreaning> treanings = [];
    for (var element in rawTreanings) {
      treanings.add(await _itemToTreaning(element));
    }
    return Right(treanings);
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> currentTreaning() async {
    final treaning =
        await (localDatabase.select(localDatabase.driftHallTreaningsTable)
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
        await (localDatabase.select(localDatabase.driftHallTreaningsTable)
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
    await localDatabase
        .into(localDatabase.driftHallTreaningsTable)
        .insertOnConflictUpdate(
          DriftHallTreaningsTableCompanion.insert(
            id: treaning.id,
            hallId: treaning.climbingHall.id,
            date: treaning.date,
            finish: Value(treaning.getFinish),
          ),
        );

    return Right(treaning);
  }

  @override
  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt(
      {required ClimbingHallTreaning treaning,
      required ClimbingHallAttempt attempt}) async {
    if (attempt.id == null) {
      final int id = await localDatabase
          .into(localDatabase.driftHallAttemptsTable)
          .insert(DriftHallAttemptsTableCompanion.insert(
            treaningId: treaning.id,
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
          .into(localDatabase.driftHallAttemptsTable)
          .insertOnConflictUpdate(DriftHallAttemptsTableCompanion.insert(
            id: Value(attempt.id!),
            treaningId: treaning.id,
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
    required String treaningId,
  }) async {
    final data =
        await (localDatabase.select(localDatabase.driftHallAttemptsTable)
              ..where((tbl) => tbl.treaningId.equals(treaningId)))
            .get();

    final List<ClimbingHallAttempt> attempts = [];

    for (var element in data) {
      attempts.add(await _itemToAttempt(item: element, hallId: hallId));
    }

    return attempts;
  }

  Future<ClimbingHallAttempt> _itemToAttempt({
    required DriftHallAttempt item,
    required int hallId,
    ClimbingHallRoute? route,
  }) async {
    if (route == null && item.routeId != null) {
      final failureOrRoute = await getIt<ClimbingHallDataSource>()
          .getRouteById(id: item.routeId!, hallId: hallId);

      route = failureOrRoute.fold((l) => null, (route) => route);
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

  Future<ClimbingHallTreaning> _itemToTreaning(DriftHallTreaning item) async {
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
    await (localDatabase.delete(localDatabase.driftHallAttemptsTable)
          ..where((tbl) => tbl.id.equals(attempt.id!)))
        .go();

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning}) async {
    await (localDatabase.delete(localDatabase.driftHallAttemptsTable)
          ..where((tbl) => tbl.treaningId.equals(treaning.id)))
        .go();
    await (localDatabase.delete(localDatabase.driftHallTreaningsTable)
          ..where((tbl) => tbl.id.equals(treaning.id)))
        .go();

    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<ClimbingHallAttempt>>> routeAttempts(
      {required ClimbingHallRoute route}) async {
    final data =
        await (localDatabase.select(localDatabase.driftHallAttemptsTable)
              ..where((tbl) => tbl.routeId.equals(route.id!))
              ..orderBy([
                (u) =>
                    OrderingTerm(expression: u.start, mode: OrderingMode.desc),
              ]))
            .get();

    final List<ClimbingHallAttempt> attempts = [];

    for (var element in data) {
      attempts
          .add(await _itemToAttempt(item: element, hallId: 0, route: route));
    }

    return Right(attempts);
  }

  Future<List<DriftHallTreaning>> _getAllTreanings() async =>
      (localDatabase.select(localDatabase.driftHallTreaningsTable)
            ..orderBy(
              [
                (u) => OrderingTerm(expression: u.date, mode: OrderingMode.desc)
              ],
            ))
          .get();
}
