import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';

@LazySingleton()
class AddAscensionUsecase {
  final AscensionRepository _ascensionRepository;

  AddAscensionUsecase(this._ascensionRepository);

  Future<Either<Failure, Ascension>> call({
    required Mountain mountain,
    required MountainRoute route,
    DateTime? date,
  }) async {
    final ascension = Ascension(
      date: date ?? DateTime.now(),
      mountain: mountain,
      route: route,
    );

    final failureOrUnit =
        await _ascensionRepository.saveAscention(ascension: ascension);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) => Right(ascension),
    );
  }
}
