import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';

@LazySingleton()
class GetGymRouteStatistic {
  final HallTreaningRepository _treaningRepository;

  GetGymRouteStatistic(this._treaningRepository);

  Future<Either<Failure, Map<ClimbingHallRoute, GymRouteAttemptsStatistic>>>
      call({required List<ClimbingHallRoute> routes}) async {
    final Map<ClimbingHallRoute, GymRouteAttemptsStatistic> map = {};

    for (final route in routes) {
      final failureOrAttempts =
          await _treaningRepository.routeAttempts(route: route);

      failureOrAttempts.fold(
        (l) => null,
        (attempts) {
          if (attempts.isNotEmpty) {
            map[route] = GymRouteAttemptsStatistic(attempts: attempts);
          }
        },
      );
    }

    return Right(map);
  }
}
