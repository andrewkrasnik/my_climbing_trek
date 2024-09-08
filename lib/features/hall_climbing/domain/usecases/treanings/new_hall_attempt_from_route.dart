import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewHallAttemptFromRoute {
  final HallTreaningRepository hallTreaningRepository;
  NewHallAttemptFromRoute({
    required this.hallTreaningRepository,
  });

  Future<Either<Failure, ClimbingHallTreaning>> call({
    required ClimbingHall climbingHall,
    required ClimbingHallRoute route,
    required ClimbingStyle style,
    required ClimbingHallTreaning treaning,
  }) async {
    final attempt = ClimbingHallAttempt(
      route: route,
      style: style,
      category: route.category,
      treaningId: treaning.id,
    )..start();

    await hallTreaningRepository.saveAttempt(
        treaning: treaning, attempt: attempt);

    treaning.attempts.add(attempt);

    return Right(treaning);
  }
}
