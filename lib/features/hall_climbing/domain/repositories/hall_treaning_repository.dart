import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/treanings/domain/repositories/treanings_repository.dart';

abstract class HallTreaningRepository implements TreaningsRepository {
  Future<Either<Failure, ClimbingHallTreaning?>> lastTreaning();

  Future<Either<Failure, ClimbingHallTreaning?>> currentTreaning();

  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> getTreanings();

  Future<Either<Failure, ClimbingHallTreaning>> saveTreaning(
      {required ClimbingHallTreaning treaning});

  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning});

  Future<Either<Failure, Unit>> deleteAttempt(
      {required ClimbingHallAttempt attempt});

  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt({
    required ClimbingHallTreaning treaning,
    required ClimbingHallAttempt attempt,
  });

  Future<Either<Failure, List<ClimbingHallAttempt>>> routeAttempts(
      {required ClimbingHallRoute route});

  Future<Either<Failure, ClimbingHallTreaning>> getTreaning(
      {required String treaningId});
}
