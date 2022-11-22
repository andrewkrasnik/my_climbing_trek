import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteHallAttempt {
  final HallTreaningRepository treaningRepository;
  DeleteHallAttempt({
    required this.treaningRepository,
  });

  Future<Either<Failure, Unit>> call({
    required ClimbingHallAttempt attempt,
  }) async {
    return await treaningRepository.deleteAttempt(attempt: attempt);
  }
}
