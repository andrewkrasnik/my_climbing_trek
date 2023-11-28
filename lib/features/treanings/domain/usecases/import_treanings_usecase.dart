import 'package:my_climbing_trek/core/data/treaning.dart';
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
class ImportTreaningsUseCase {
  final HallTreaningRepository _hallTreaningRepository;
  final IceTreaningsRepository _iceTreaningsRepository;
  final StrengthTreaningsRepository _strengthTreaningsRepository;
  final CardioTreaningsRepository _cardioTreaningsRepository;
  final RockTreaningsRepository _rockTreaningsRepository;
  final TravelRepository _travelRepository;
  final TrekkingPathRepository _trekkingPathRepository;
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;
  final AscensionRepository _ascensionRepository;

  ImportTreaningsUseCase(
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

  Future<Either<Failure, Unit>> call({
    required Map<String, dynamic> data,
  }) async {
    if (data['hall_treanings'] != null) {
      final failureOrUnit = await _hallTreaningRepository
          .saveJsonTreanings(data['hall_treanings'] as List<dynamic>);

      if (failureOrUnit.isLeft()) {
        return Left(failureOrUnit.fold(
          (failure) => failure,
          (_) => Failure(),
        ));
      }
    }

    if (data['ice_treanings'] != null) {
      final failureOrUnit = await _iceTreaningsRepository
          .saveJsonTreanings(data['ice_treanings']);

      if (failureOrUnit.isLeft()) {
        return Left(failureOrUnit.fold(
          (failure) => failure,
          (_) => Failure(),
        ));
      }
    }

    if (data['cardio_treanings'] != null) {
      final failureOrUnit = await _cardioTreaningsRepository
          .saveJsonTreanings(data['cardio_treanings']);

      if (failureOrUnit.isLeft()) {
        return Left(failureOrUnit.fold(
          (failure) => failure,
          (_) => Failure(),
        ));
      }
    }

    if (data['strength_treanings'] != null) {
      final failureOrUnit = await _strengthTreaningsRepository
          .saveJsonTreanings(data['strength_treanings']);

      if (failureOrUnit.isLeft()) {
        return Left(failureOrUnit.fold(
          (failure) => failure,
          (_) => Failure(),
        ));
      }
    }

    if (data['rock_treanings'] != null) {
      final failureOrUnit = await _rockTreaningsRepository
          .saveJsonTreanings(data['rock_treanings']);

      if (failureOrUnit.isLeft()) {
        return Left(failureOrUnit.fold(
          (failure) => failure,
          (_) => Failure(),
        ));
      }
    }

    if (data['techniques_treanings'] != null) {
      final failureOrUnit = await _techniqueTreaningsRepository
          .saveJsonTreanings(data['techniques_treanings']);

      if (failureOrUnit.isLeft()) {
        return Left(failureOrUnit.fold(
          (failure) => failure,
          (_) => Failure(),
        ));
      }
    }

    // if (settings.useTraveling) {
    //   final failureOrTravels = await _travelRepository.getTreanings();

    //   failureOrTravels.fold(
    //     (failure) => null,
    //     (travels) => treanings['travels'] = travels,
    //   );
    // }

    // if (settings.useTrekking) {
    //   final failureOrPaths = await _trekkingPathRepository.getTreanings();

    //   failureOrPaths.fold(
    //     (failure) => null,
    //     (paths) => treanings['trekking_treanings'] = paths,
    //   );
    // }

    // if (settings.useMountaineering) {
    //   final failureOrAscentions = await _ascensionRepository.getTreanings();

    //   failureOrAscentions.fold(
    //     (failure) => null,
    //     (ascentions) => treanings['ascentions_treanings'] = ascentions,
    //   );
    // }

    return const Right(unit);
  }
}
