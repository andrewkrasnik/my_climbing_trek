import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class GetCurrentTravelDayUsecase {
  final TravelRepository _travelRepository;

  GetCurrentTravelDayUsecase(this._travelRepository);

  Future<Either<Failure, TravelDay?>> call({required Travel travel}) async {
    final failureOrDays = await _travelRepository.getTravelDays(travel: travel);
    return failureOrDays.fold(
      (failure) => Left(failure),
      (days) {
        final result = days.firstWhereOrNull((element) => element.date
            .toDayStart()
            .isAtSameMomentAs(DateTime.now().toDayStart()));

        return Right(result);
      },
    );
  }
}
