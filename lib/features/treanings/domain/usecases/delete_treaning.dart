import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class DeleteTreaning {
  final HallTreaningRepository _hallTreaningRepository;
  final IceTreaningsRepository _iceTreaningsRepository;
  final StrengthTreaningsRepository _strengthTreaningsRepository;
  final CardioTreaningsRepository _cardioTreaningsRepository;
  final RockTreaningsRepository _rockTreaningsRepository;
  final TrekkingPathRepository _trekkingPathRepository;
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;
  final AscensionRepository _ascensionRepository;

  DeleteTreaning(
    this._hallTreaningRepository,
    this._iceTreaningsRepository,
    this._strengthTreaningsRepository,
    this._cardioTreaningsRepository,
    this._rockTreaningsRepository,
    this._trekkingPathRepository,
    this._techniqueTreaningsRepository,
    this._ascensionRepository,
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
    } else if (treaning is RockTreaning) {
      return _rockTreaningsRepository.deleteTreaning(treaning: treaning);
    } else if (treaning is TrekkingPath) {
      return _trekkingPathRepository.deleteTreaning(treaning: treaning);
    } else if (treaning is TechniqueTreaning) {
      return _techniqueTreaningsRepository.deleteTreaning(treaning: treaning);
    } else if (treaning is Ascension) {
      return _ascensionRepository.deleteAscention(ascension: treaning);
    } else {
      return Left(UseCaseFailure());
    }
  }
}
