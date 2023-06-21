import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class CurrentTravelUsecase {
  final TravelRepository _travelRepository;

  CurrentTravelUsecase(this._travelRepository);

  Future<Either<Failure, Travel?>> call() async {
    return await _travelRepository.currentTravel();
  }
}
