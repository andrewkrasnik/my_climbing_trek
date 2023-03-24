import 'package:climbing_diary/core/failures/failure.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';

import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetHallRouteAttempts {
  final HallTreaningRepository repository;

  GetHallRouteAttempts({
    required this.repository,
  });

  Future<Either<Failure, List<ClimbingHallAttempt>>> call({
    required ClimbingHallRoute route,
  }) async {
    return await repository.routeAttempts(route: route);
  }
}
