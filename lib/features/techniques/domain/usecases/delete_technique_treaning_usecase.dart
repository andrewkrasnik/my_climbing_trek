import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class DeleteTechniqueTreaningUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  DeleteTechniqueTreaningUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, Unit>> call({
    required TechniqueTreaning treaning,
  }) async {
    return await _techniqueTreaningsRepository.deleteTreaning(
        treaning: treaning);
  }
}
