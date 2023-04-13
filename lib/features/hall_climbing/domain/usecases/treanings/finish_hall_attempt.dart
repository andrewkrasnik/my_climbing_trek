import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FinishHallAttempt {
  final HallTreaningRepository treaningRepository;
  FinishHallAttempt({
    required this.treaningRepository,
  });

  Future<Either<Failure, ClimbingHallAttempt>> call({
    required ClimbingHallTreaning treaning,
    required ClimbingHallAttempt attempt,
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    int attemptCount = 0,
  }) async {
    final GymRouteAttemptsStatistic? statistic;
    if (attempt.route != null) {
      final failureOrAttempts =
          await treaningRepository.routeAttempts(route: attempt.route!);
      statistic = failureOrAttempts.fold(
        (l) => null,
        (attempts) => GymRouteAttemptsStatistic(attempts: attempts),
      );
    } else {
      statistic = null;
    }

    attempt.finish(
      statistic: statistic,
      downClimbing: downClimbing,
      fail: fail,
      fallCount: fallCount,
      suspensionCount: suspensionCount,
    );
    return await treaningRepository.saveAttempt(
        treaning: treaning, attempt: attempt);
  }
}
