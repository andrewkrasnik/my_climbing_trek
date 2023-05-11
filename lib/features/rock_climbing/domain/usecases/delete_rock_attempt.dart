import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class DeleteRockAttempt {
  final RockTreaningsRepository _rockTreaningsRepository;

  DeleteRockAttempt(
    this._rockTreaningsRepository,
  );

  Future<Either<Failure, Unit>> call(
      {required RockTreaningAttempt attempt}) async {
    return await _rockTreaningsRepository.deleteAttempt(attempt: attempt);
  }
}
