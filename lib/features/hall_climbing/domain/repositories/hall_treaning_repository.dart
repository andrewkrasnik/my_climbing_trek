import 'package:climbing_diary/core/failures/failure.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class HallTreaningRepository {
  Future<Either<Failure, ClimbingHallTreaning>> lastTreaning();
  Future<Either<Failure, ClimbingHallTreaning>> currentTreaning();

  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings();
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
}
