import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class GetRockRouteAttempts {
  final RockTreaningsRepository _treaningRepository;

  GetRockRouteAttempts(this._treaningRepository);

  Future<Either<Failure, List<RockTreaningAttempt>>> call(
      {required RockRoute route, required RockSector sector}) async {
    return await _treaningRepository.routeAttempts(
      route: route,
      sector: sector,
    );
  }
}
