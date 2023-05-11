import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteIceAttempt {
  final IceTreaningsRepository _iceTreaningsRepository;

  DeleteIceAttempt(
    this._iceTreaningsRepository,
  );

  Future<Either<Failure, Unit>> call(
      {required IceTreaningAttempt attempt}) async {
    return await _iceTreaningsRepository.deleteAttempt(attempt: attempt);
  }
}
