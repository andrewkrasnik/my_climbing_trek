import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class EditTravelUsecase {
  final TravelRepository _travelRepository;

  EditTravelUsecase(this._travelRepository);

  Future<Either<Failure, Travel>> call({
    required Travel travel,
    TravelStatus? status,
    String? name,
    String? description,
    String? image,
    DateTime? date,
    DateTime? start,
    DateTime? finish,
    Currency? budgetCurrency,
    List<Currency>? currencies,
    List<Region>? regions,
  }) async {
    final newTravel = Travel(
      date: date ?? travel.date,
      start: start ?? travel.start,
      finish: finish ?? travel.finish,
      description: description ?? travel.description,
      regions: regions ?? travel.regions,
      name: name ?? travel.name,
      image: image ?? travel.image,
      status: status ?? travel.status,
      budgetCurrency: budgetCurrency ?? travel.budgetCurrency,
      currencies: currencies ?? travel.currencies,
      id: travel.id,
    );

    if (travel.start != newTravel.start || travel.finish != newTravel.finish) {
      final failureOrDays =
          await _travelRepository.getTravelDays(travel: travel);

      if (failureOrDays.isRight()) {
        final List<TravelDay> days =
            failureOrDays.fold((_) => [], (days) => days);

        for (final day in days) {
          final failureOrDayUnit =
              await _travelRepository.deleteTravelDay(line: day);

          if (failureOrDayUnit.isLeft()) {
            return failureOrDayUnit.fold(
              (failure) => Left(failure),
              (_) => Left(Failure()),
            );
          }
        }

        final newDays = newTravel.travelDays;

        for (final day in newDays) {
          final failureOrDayUnit =
              await _travelRepository.editTravelDay(line: day);

          if (failureOrDayUnit.isLeft()) {
            return failureOrDayUnit.fold(
              (failure) => Left(failure),
              (_) => Left(Failure()),
            );
          }
        }
      } else {
        return Left(failureOrDays.fold((failure) => failure, (_) => Failure()));
      }
    }

    final failureOrTravel =
        await _travelRepository.saveTravel(travel: newTravel);

    return failureOrTravel.fold(
      (failure) => Left(failure),
      (_) => Right(newTravel),
    );
  }
}
