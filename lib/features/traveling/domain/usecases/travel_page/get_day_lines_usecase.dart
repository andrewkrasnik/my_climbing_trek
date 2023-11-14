import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class GetDayLinesUsecase {
  final TravelRepository _travelRepository;

  GetDayLinesUsecase(this._travelRepository);

  Future<Either<Failure, List<TravelDay>>> call(
      {required Travel travel}) async {
    return await _travelRepository.getTravelDays(travel: travel);
  }
}
