import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';

abstract class IceTreaningsRepository {
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning});
  Future<Either<Failure, List<IceTreaning>>> getTreanings();

  Future<Either<Failure, IceTreaning?>> getCurrentTreaning();

  Future<Either<Failure, IceTreaning?>> getPreviousTreaning();

  Future<Either<Failure, Unit>> deleteTreaning({required IceTreaning treaning});

  Future<Either<Failure, Unit>> deleteAttempt(
      {required IceTreaningAttempt attempt});
}
