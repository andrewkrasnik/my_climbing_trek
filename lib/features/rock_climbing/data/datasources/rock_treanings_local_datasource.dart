import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';

abstract class RockTreaningsLocalDataSource {
  Future<Either<Failure, RockTreaning>> saveTreaning(
      {required RockTreaning treaning});
  Future<Either<Failure, List<RockTreaning>>> getTreanings();
  Future<Either<Failure, RockTreaning?>> getCurrentTreaning();
  Future<Either<Failure, RockTreaning?>> getPreviousTreaning();

  Future<Either<Failure, Unit>> deleteTreaning(
      {required RockTreaning treaning});
}
