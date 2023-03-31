import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';
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
