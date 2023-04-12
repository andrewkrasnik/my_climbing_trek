import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class HallTreaningDataSource {
  Future<Either<Failure, ClimbingHallTreaning?>> lastTreaning();

  Future<Either<Failure, ClimbingHallTreaning?>> currentTreaning();

  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings();

  Future<Either<Failure, ClimbingHallTreaning>> saveTreaning(
      {required ClimbingHallTreaning treaning});

  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt({
    required ClimbingHallTreaning treaning,
    required ClimbingHallAttempt attempt,
  });

  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning});
  Future<Either<Failure, Unit>> deleteAttempt(
      {required ClimbingHallAttempt attempt});

  Future<Either<Failure, List<ClimbingHallAttempt>>> routeAttempts(
      {required ClimbingHallRoute route});
}
