import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';

@LazySingleton()
class GetAscensionUsecase {
  final AscensionRepository _ascensionRepository;

  GetAscensionUsecase(this._ascensionRepository);

  Future<Either<Failure, Ascension?>> call() async {
    return await _ascensionRepository.currentAscention();
  }
}
