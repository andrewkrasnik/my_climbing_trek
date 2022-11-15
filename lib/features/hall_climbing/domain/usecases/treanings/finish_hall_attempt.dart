import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
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
    attempt.finish(
      attemptCount: suspensionCount,
      downClimbing: downClimbing,
      fail: fail,
      fallCount: fallCount,
      suspensionCount: suspensionCount,
    );
    return await treaningRepository.saveAttempt(
        treaning: treaning, attempt: attempt);
  }
}
