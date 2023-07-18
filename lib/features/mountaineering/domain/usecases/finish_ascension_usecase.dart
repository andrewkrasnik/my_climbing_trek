import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';

@LazySingleton()
class FinishAscensionUsecase {
  final AscensionRepository _ascensionRepository;

  FinishAscensionUsecase(this._ascensionRepository);

  Future<Either<Failure, Unit>> call({
    required Ascension ascension,
  }) async {
    ascension.finishTreaning();

    return _ascensionRepository.saveAscention(ascension: ascension);
  }
}
