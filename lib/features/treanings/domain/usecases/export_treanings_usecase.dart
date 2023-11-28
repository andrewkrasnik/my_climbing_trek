import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class ExportTreaningsUseCase {
  final HallTreaningRepository _hallTreaningRepository;
  final IceTreaningsRepository _iceTreaningsRepository;
  final StrengthTreaningsRepository _strengthTreaningsRepository;
  final CardioTreaningsRepository _cardioTreaningsRepository;
  final RockTreaningsRepository _rockTreaningsRepository;
  final TravelRepository _travelRepository;
  final TrekkingPathRepository _trekkingPathRepository;
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;
  final AscensionRepository _ascensionRepository;

  ExportTreaningsUseCase(
    this._hallTreaningRepository,
    this._iceTreaningsRepository,
    this._strengthTreaningsRepository,
    this._cardioTreaningsRepository,
    this._rockTreaningsRepository,
    this._travelRepository,
    this._trekkingPathRepository,
    this._techniqueTreaningsRepository,
    this._ascensionRepository,
  );

  Future<Either<Failure, Map<String, List<dynamic>>>> call({
    required TreaningsSettings settings,
  }) async {
    final Map<String, List<dynamic>> treanings = {};

    if (settings.useGymTreanings) {
      final failureOrHallTreanings =
          await _hallTreaningRepository.getJsonTreanings();

      failureOrHallTreanings.fold(
        (failure) => null,
        (hallTreanings) => treanings['hall_treanings'] = hallTreanings,
      );
    }

    if (settings.useIceTreanings) {
      final failureOrIceTreanings =
          await _iceTreaningsRepository.getJsonTreanings();

      failureOrIceTreanings.fold(
        (failure) => null,
        (iceTreanings) => treanings['ice_treanings'] = iceTreanings,
      );
    }

    if (settings.useCardioTreanings) {
      final failureOrCardioTreanings =
          await _cardioTreaningsRepository.getJsonTreanings();

      failureOrCardioTreanings.fold(
        (failure) => null,
        (cardioTreanings) => treanings['cardio_treanings'] = cardioTreanings,
      );
    }

    if (settings.useStrengthTraining) {
      final failureOrStrengthTreanings =
          await _strengthTreaningsRepository.getJsonTreanings();

      failureOrStrengthTreanings.fold(
        (failure) => null,
        (strengthTreanings) =>
            treanings['strength_treanings'] = strengthTreanings,
      );
    }

    if (settings.useRockTraining) {
      final failureOrRockTreanings =
          await _rockTreaningsRepository.getJsonTreanings();

      failureOrRockTreanings.fold(
        (failure) => null,
        (rockTreanings) => treanings['rock_treanings'] = rockTreanings,
      );
    }

    if (settings.useTechniques) {
      final failureOrTechniques =
          await _techniqueTreaningsRepository.getJsonTreanings();

      failureOrTechniques.fold(
        (failure) => null,
        (techniques) => treanings['techniques_treanings'] = techniques,
      );
    }

    // if (settings.useTraveling) {
    //   final failureOrTravels = await _travelRepository.getJsonTreanings();

    //   failureOrTravels.fold(
    //     (failure) => null,
    //     (travels) => treanings['travels'] = travels,
    //   );
    // }

    if (settings.useTrekking) {
      final failureOrPaths = await _trekkingPathRepository.getJsonTreanings();

      failureOrPaths.fold(
        (failure) => null,
        (paths) => treanings['trekking_treanings'] = paths,
      );
    }

    if (settings.useMountaineering) {
      final failureOrAscentions = await _ascensionRepository.getJsonTreanings();

      failureOrAscentions.fold(
        (failure) => null,
        (ascentions) => treanings['ascentions_treanings'] = ascentions,
      );
    }

    return Right(treanings);
  }
}
