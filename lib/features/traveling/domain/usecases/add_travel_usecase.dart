import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class AddTravelUsecase {
  final TravelRepository _travelRepository;

  AddTravelUsecase(this._travelRepository);

  Future<Either<Failure, Travel>> call({
    required String name,
    required String description,
    required String image,
    DateTime? date,
    DateTime? start,
    DateTime? finish,
  }) async {
    final travel = Travel(
        date: date ?? DateTime.now(),
        start: start,
        finish: finish,
        description: description,
        regions: [],
        name: name,
        image: image);

    final failureOrUnit = await _travelRepository.saveTravel(travel: travel);
    return failureOrUnit.fold((failure) => Left(failure), (_) async {
      final days = travel.travelDays;

      for (final day in days) {
        final failureOrDayUnit =
            await _travelRepository.editTravelDay(line: day);

        if (failureOrDayUnit.isLeft()) {
          return failureOrDayUnit.fold(
            (failure) => Left(failure),
            (_) => Left(Failure()),
          );
        }
      }

      return Right(travel);
    });
  }
}
