import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/hall_treaning_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';

// @LazySingleton(as: HallTreaningDataSource)
class MockHallTreaningDataSource implements HallTreaningDataSource {
  final List<ClimbingHallTreaning> _treanings = [];

  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> currentTreaning() async {
    if (_treanings.isNotEmpty && !_treanings.last.finished) {
      return Right(_treanings.last);
    } else {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> lastTreaning() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> saveTreaning(
      {required ClimbingHallTreaning treaning}) async {
    // final ClimbingHallTreaning treaning = ClimbingHallTreaning(
    //     date: DateTime.now(), climbingHall: climbingHall, attempts: []);
    _treanings.add(treaning);
    return Right(treaning);
  }

  @override
  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt(
      {required ClimbingHallTreaning treaning,
      required ClimbingHallAttempt attempt}) async {
    treaning.attempts.add(attempt);
    return Right(attempt);
  }

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required ClimbingHallAttempt attempt}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ClimbingHallAttempt>>> routeAttempts(
      {required ClimbingHallRoute route}) {
    throw UnimplementedError();
  }
}
