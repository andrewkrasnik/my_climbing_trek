import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteTreaning {
  final HallTreaningRepository _hallTreaningRepository;
  final IceTreaningsRepository _iceTreaningsRepository;
  final StrengthTreaningsRepository _strengthTreaningsRepository;
  final CardioTreaningsRepository _cardioTreaningsRepository;

  DeleteTreaning(
    this._hallTreaningRepository,
    this._iceTreaningsRepository,
    this._strengthTreaningsRepository,
    this._cardioTreaningsRepository,
  );

  Future<Either<Failure, Unit>> call({required Treaning treaning}) async {
    if (treaning is ClimbingHallTreaning) {
      return await _hallTreaningRepository.deleteTreaning(treaning: treaning);
    } else if (treaning is IceTreaning) {
      return _iceTreaningsRepository.deleteTreaning(treaning: treaning);
    } else if (treaning is CardioTreaning) {
      return _cardioTreaningsRepository.delete(treaning: treaning);
    } else if (treaning is StrengthTreaning) {
      return _strengthTreaningsRepository.deleteTreaning(treaning: treaning);
    } else {
      return Left(UseCaseFailure());
    }
  }
}
