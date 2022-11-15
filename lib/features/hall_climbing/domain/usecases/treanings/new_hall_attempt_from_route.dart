import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewHallAttemptFromRoute {
  final HallTreaningRepository hallTreaningRepository;
  NewHallAttemptFromRoute({
    required this.hallTreaningRepository,
  });

  Future<Either<Failure, ClimbingHallTreaning>> call(
      {required ClimbingHallRoute route, required ClimbingStyle style}) async {
    final failureOrCurrentTreaning =
        await hallTreaningRepository.currentTreaning();

    final currentTreaning =
        await failureOrCurrentTreaning.fold((faulure) async {
      final failureOrTreaning = await hallTreaningRepository.newTreaning(
          climbingHall: route.climbingHall);

      return failureOrTreaning.fold(
          (failure) => throw Error(), (treaning) => treaning);
    }, (treaning) async => treaning);

    currentTreaning.attempts.add(
        ClimbingHallAttempt.fromRoute(route: route, style: style)..start());

    return Right(currentTreaning);
  }
}
