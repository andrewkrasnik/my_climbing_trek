import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveHallTreaningUseCase {
  final HallTreaningRepository _treaningRepository;

  SaveHallTreaningUseCase(
    this._treaningRepository,
  );

  Future<Either<Failure, ClimbingHallTreaning>> call(
      {required ClimbingHallTreaning treaning}) async {
    return await _treaningRepository.saveTreaning(treaning: treaning);
  }
}