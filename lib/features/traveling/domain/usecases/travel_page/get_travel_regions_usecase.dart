import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_regions_repository.dart';

@LazySingleton()
class GetTravelRegionsUsecase {
  final TravelRegionsRepository _travelRegionsRepository;

  GetTravelRegionsUsecase(this._travelRegionsRepository);

  Future<Either<Failure, List<Region>>> call() async {
    return await _travelRegionsRepository.regions();
  }
}
