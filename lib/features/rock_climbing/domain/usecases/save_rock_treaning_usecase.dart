import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class SaveRockTreaningUseCase {
  final RockTreaningsRepository _rockTreaningsRepository;

  SaveRockTreaningUseCase(
    this._rockTreaningsRepository,
  );

  Future<Either<Failure, RockTreaning>> call(
      {required RockTreaning treaning}) async {
    return await _rockTreaningsRepository.saveTreaning(treaning: treaning);
  }
}
