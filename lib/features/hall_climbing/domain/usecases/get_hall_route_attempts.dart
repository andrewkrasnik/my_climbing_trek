import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
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
