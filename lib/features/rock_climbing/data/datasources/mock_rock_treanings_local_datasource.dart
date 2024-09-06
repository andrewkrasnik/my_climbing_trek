import 'package:collection/collection.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';

// @LazySingleton(as: RockTreaningsLocalDataSource)
class MockRockTreaningsLocalDataSource implements RockTreaningsLocalDataSource {
  final List<RockTreaning> _treanings = [];

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required RockTreaning treaning}) async {
    _treanings.remove(treaning);
    return const Right(unit);
  }

  @override
  Future<Either<Failure, RockTreaning?>> getCurrentTreaning() async {
    return Right(_treanings.firstWhereOrNull((element) => !element.finished));
  }

  @override
  Future<Either<Failure, RockTreaning?>> getPreviousTreaning() async {
    return Right(_treanings.firstWhereOrNull((element) => element.finished));
  }

  @override
  Future<Either<Failure, List<RockTreaning>>> getTreanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, RockTreaning>> saveTreaning(
      {required RockTreaning treaning}) async {
    if (!_treanings.contains(treaning)) {
      _treanings.add(treaning);
    }
    return Right(treaning);
  }

  @override
  Future<Either<Failure, List<RockTreaningAttempt>>> routeAttempts({
    required RockRoute route,
    required RockSector sector,
  }) async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required RockTreaningAttempt attempt}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RockTreaning>> getTreaning(
      {required String treaningId}) {
    // TODO: implement getTreaning
    throw UnimplementedError();
  }
}
