import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAllTreanings {
  final HallTreaningRepository _hallTreaningRepository;
  final IceTreaningsRepository _iceTreaningsRepository;
  final StrengthTreaningsRepository _strengthTreaningsRepository;
  final CardioTreaningsRepository _cardioTreaningsRepository;

  GetAllTreanings(
    this._hallTreaningRepository,
    this._iceTreaningsRepository,
    this._strengthTreaningsRepository,
    this._cardioTreaningsRepository,
  );

  Future<Either<Failure, List<Treaning>>> call() async {
    final List<Treaning> treanings = [];

    final failureOrHallTreanings = await _hallTreaningRepository.allTreanings();

    failureOrHallTreanings.fold(
      (failure) => null,
      (hallTreanings) => treanings.addAll(hallTreanings),
    );

    final failureOrIceTreanings = await _iceTreaningsRepository.getTreanings();

    failureOrIceTreanings.fold(
      (failure) => null,
      (iceTreanings) => treanings.addAll(iceTreanings),
    );

    final failureOrCardioTreanings =
        await _cardioTreaningsRepository.getTreanings();

    failureOrCardioTreanings.fold(
      (failure) => null,
      (cardioTreanings) => treanings.addAll(cardioTreanings),
    );

    final failureOrStrengthTreanings =
        await _strengthTreaningsRepository.getTreanings();

    failureOrStrengthTreanings.fold(
      (failure) => null,
      (strengthTreanings) => treanings.addAll(strengthTreanings),
    );

    treanings.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return Right(treanings);
  }
}
