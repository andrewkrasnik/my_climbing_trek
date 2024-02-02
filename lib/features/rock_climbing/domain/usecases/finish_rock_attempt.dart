import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class FinishRockAttempt {
  final RockTreaningsRepository _rockTreaningsRepository;

  FinishRockAttempt(
    this._rockTreaningsRepository,
  );

  Future<Either<Failure, RockTreaningAttempt>> call({
    required RockTreaning treaning,
    required RockTreaningAttempt attempt,
    required bool fail,
    required bool downClimbing,
    required int fallCount,
    required int suspensionCount,
  }) async {
    final RockRouteAttemptsStatistic? statistic;
    if (attempt.route != null) {
      final failureOrAttempts = await _rockTreaningsRepository.routeAttempts(
          route: attempt.route!, sector: attempt.sector);
      statistic = failureOrAttempts.fold(
        (l) => null,
        (attempts) => RockRouteAttemptsStatistic(attempts: attempts),
      );
    } else {
      statistic = null;
    }

    attempt.finish(
      fail: fail,
      downClimbing: downClimbing,
      fallCount: fallCount,
      suspensionCount: suspensionCount,
      statistic: statistic,
    );

    final failureOrTreaning =
        await _rockTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrTreaning.fold(
        (failure) => Left(failure), (_) => Right(attempt));
  }
}
