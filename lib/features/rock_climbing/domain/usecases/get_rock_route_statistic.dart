import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class GetRockRouteStatistic {
  final RockTreaningsRepository _treaningRepository;

  GetRockRouteStatistic(this._treaningRepository);

  Future<Either<Failure, Map<RockRoute, RockRouteAttemptsStatistic>>> call(
      {required List<RockRoute> routes, required RockSector sector}) async {
    final Map<RockRoute, RockRouteAttemptsStatistic> map = {};

    for (final route in routes) {
      final failureOrAttempts = await _treaningRepository.routeAttempts(
        route: route,
        sector: sector,
      );

      failureOrAttempts.fold(
        (l) => null,
        (attempts) {
          if (attempts.isNotEmpty) {
            map[route] = RockRouteAttemptsStatistic(attempts: attempts);
          }
        },
      );
    }

    return Right(map);
  }
}
