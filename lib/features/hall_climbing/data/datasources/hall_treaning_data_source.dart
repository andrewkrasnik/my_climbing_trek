import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class HallTreaningDataSource {
  Future<Either<Failure, ClimbingHallTreaning>> lastTreaning();
  Future<Either<Failure, ClimbingHallTreaning>> currentTreaning();
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings();
  Future<Either<Failure, ClimbingHallTreaning>> newTreaning(
      {required ClimbingHall climbingHall});
}
