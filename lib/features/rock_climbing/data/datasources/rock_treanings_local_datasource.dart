import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';

abstract class RockTreaningsLocalDataSource {
  Future<Either<Failure, RockTreaning>> saveTreaning(
      {required RockTreaning treaning});
  Future<Either<Failure, List<RockTreaning>>> getTreanings();
  Future<Either<Failure, RockTreaning?>> getCurrentTreaning();
  Future<Either<Failure, RockTreaning?>> getPreviousTreaning();

  Future<Either<Failure, Unit>> deleteTreaning(
      {required RockTreaning treaning});

  Future<Either<Failure, List<RockTreaningAttempt>>> routeAttempts({
    required RockRoute route,
    required RockSector sector,
  });

  Future<Either<Failure, Unit>> deleteAttempt(
      {required RockTreaningAttempt attempt});

  Future<Either<Failure, RockTreaning>> getTreaning(
      {required String treaningId});
}
