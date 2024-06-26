import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class GetAllTreanings {
  final HallTreaningRepository _hallTreaningRepository;
  final IceTreaningsRepository _iceTreaningsRepository;
  final StrengthTreaningsRepository _strengthTreaningsRepository;
  final CardioTreaningsRepository _cardioTreaningsRepository;
  final RockTreaningsRepository _rockTreaningsRepository;
  final TravelRepository _travelRepository;
  final TrekkingPathRepository _trekkingPathRepository;
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;
  final AscensionRepository _ascensionRepository;

  GetAllTreanings(
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

  Future<Either<Failure, List<Treaning>>> call({
    required bool rock,
    required bool gym,
    required bool ice,
    required bool cardio,
    required bool strength,
    required bool travel,
    required bool trekking,
    required bool techniques,
    required bool mountaneering,
  }) async {
    final List<Treaning> treanings = [];

    if (gym) {
      final failureOrHallTreanings =
          await _hallTreaningRepository.getTreanings();

      failureOrHallTreanings.fold(
        (failure) => null,
        (hallTreanings) => treanings.addAll(hallTreanings),
      );
    }

    if (ice) {
      final failureOrIceTreanings =
          await _iceTreaningsRepository.getTreanings();

      failureOrIceTreanings.fold(
        (failure) => null,
        (iceTreanings) => treanings.addAll(iceTreanings),
      );
    }

    if (cardio) {
      final failureOrCardioTreanings =
          await _cardioTreaningsRepository.getTreanings();

      failureOrCardioTreanings.fold(
        (failure) => null,
        (cardioTreanings) => treanings.addAll(cardioTreanings),
      );
    }

    if (strength) {
      final failureOrStrengthTreanings =
          await _strengthTreaningsRepository.getTreanings();

      failureOrStrengthTreanings.fold(
        (failure) => null,
        (strengthTreanings) => treanings.addAll(strengthTreanings),
      );
    }

    if (rock) {
      final failureOrRockTreanings =
          await _rockTreaningsRepository.getTreanings();

      failureOrRockTreanings.fold(
        (failure) => null,
        (rockTreanings) => treanings.addAll(rockTreanings),
      );
    }

    if (travel) {
      final failureOrTravels = await _travelRepository.getTreanings();

      failureOrTravels.fold(
        (failure) => null,
        (travels) => treanings.addAll(travels),
      );
    }

    if (trekking) {
      final failureOrPaths = await _trekkingPathRepository.getTreanings();

      failureOrPaths.fold(
        (failure) => null,
        (paths) => treanings.addAll(paths),
      );
    }

    if (techniques) {
      final failureOrTechniques =
          await _techniqueTreaningsRepository.getTreanings();

      failureOrTechniques.fold(
        (failure) => null,
        (techniques) => treanings.addAll(techniques),
      );
    }

    if (mountaneering) {
      final failureOrAscentions = await _ascensionRepository.getTreanings();

      failureOrAscentions.fold(
        (failure) => null,
        (ascentions) => treanings.addAll(ascentions),
      );
    }

    treanings.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return Right(treanings);
  }
}
