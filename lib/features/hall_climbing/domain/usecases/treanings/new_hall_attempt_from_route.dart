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

  Future<Either<Failure, ClimbingHallTreaning>> call(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route,
      required ClimbingStyle style}) async {
    final failureOrCurrentTreaning =
        await hallTreaningRepository.currentTreaning();

    final currentTreaning =
        await failureOrCurrentTreaning.fold((faulure) async {
      final newTreaning = ClimbingHallTreaning(
          date: DateTime.now(), climbingHall: climbingHall, attempts: []);

      final failureOrTreaning =
          await hallTreaningRepository.saveTreaning(treaning: newTreaning);

      return failureOrTreaning.fold(
          (failure) => throw Error(), (treaning) => treaning);
    }, (treaning) async => treaning);

    final attempt = ClimbingHallAttempt.fromRoute(route: route, style: style)
      ..start();

    final failureOrAttempt = hallTreaningRepository.saveAttempt(
        treaning: currentTreaning, attempt: attempt);

    currentTreaning.attempts.add(attempt);

    return Right(currentTreaning);
  }
}
