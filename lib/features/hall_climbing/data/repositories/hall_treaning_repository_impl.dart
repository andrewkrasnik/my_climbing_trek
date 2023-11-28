import 'dart:convert';

import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_treaning_model.dart';
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
  Future<Either<Failure, List<ClimbingHallTreaning>>> getTreanings() async {
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

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings = await dataSource.allTreanings();

    return failureOrTreanings.fold((failure) => Left(failure), (treanings) {
      try {
        return Right(treanings.map((treaning) {
          final data = (treaning as HallTreaningModel).toJson();

          data['climbingHall'] = jsonDecode(data['climbingHall']);

          for (var attempt in data['attempts']) {
            attempt['route'] = jsonDecode(attempt['route']);
          }

          return data;
        }).toList());
      } catch (error) {
        return Left(DataConvertionFailure(description: error.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    final treanings = json.map((item) {
      item['climbingHall'] = jsonEncode(item['climbingHall']);

      for (var attempt in item['attempts']) {
        attempt['route'] = jsonEncode(attempt['route']);
      }
      return HallTreaningModel.fromJson(item);
    }).toList();

    for (final treaning in treanings) {
      await dataSource.saveTreaning(treaning: treaning);
    }
    return const Right(unit);
  }
}
