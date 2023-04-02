import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
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
