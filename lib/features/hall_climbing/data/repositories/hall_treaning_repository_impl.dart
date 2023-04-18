import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/hall_treaning_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';

@LazySingleton(as: HallTreaningRepository)
class HallTreaningRepositoryImpl implements HallTreaningRepository {
  final HallTreaningDataSource dataSource;
  final ClimbingHallDataSource hallDataSource;

  HallTreaningRepositoryImpl({
    required this.dataSource,
    required this.hallDataSource,
  });

  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings() async {
    return await dataSource.allTreanings();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning?>> currentTreaning() async {
    return await dataSource.currentTreaning();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning?>> lastTreaning() async {
    return await dataSource.lastTreaning();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> saveTreaning(
      {required ClimbingHallTreaning treaning}) async {
    return await dataSource.saveTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, ClimbingHallAttempt>> saveAttempt(
      {required ClimbingHallTreaning treaning,
      required ClimbingHallAttempt attempt}) async {
    return await dataSource.saveAttempt(treaning: treaning, attempt: attempt);
  }

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required ClimbingHallAttempt attempt}) async {
    return await dataSource.deleteAttempt(attempt: attempt);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required ClimbingHallTreaning treaning}) async {
    return await dataSource.deleteTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, List<ClimbingHallAttempt>>> routeAttempts(
      {required ClimbingHallRoute route}) async {
    return await dataSource.routeAttempts(route: route);
  }
}
