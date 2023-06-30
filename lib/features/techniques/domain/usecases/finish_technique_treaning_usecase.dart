import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class FinishTechniqueTreaningUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  FinishTechniqueTreaningUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, TechniqueTreaning>> call({
    required TechniqueTreaning treaning,
  }) async {
    treaning.finishTreaning();

    final failureOrUnit =
        await _techniqueTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) => Right(treaning),
    );
  }
}
