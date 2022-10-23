import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/data/datasources/hall_treaning_data_source.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';

@LazySingleton(as: HallTreaningRepository)
class HallTreaningRepositoryImpl implements HallTreaningRepository {
  final HallTreaningDataSource dataSource;

  HallTreaningRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<ClimbingHallTreaning>>> allTreanings() async {
    return await dataSource.allTreanings();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> currentTreaning() async {
    return await dataSource.currentTreaning();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> lastTreaning() async {
    return await dataSource.lastTreaning();
  }

  @override
  Future<Either<Failure, ClimbingHallTreaning>> newTreaning(
      {required ClimbingHall climbingHall}) async {
    return await dataSource.newTreaning(climbingHall: climbingHall);
  }
}
