import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_regions_datasource.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_regions_repository.dart';

@LazySingleton(as: TravelRegionsRepository)
class TravelRegionsRepositoryImpl implements TravelRegionsRepository {
  final TravelRegionsDataSource _travelRegionsDataSource;

  TravelRegionsRepositoryImpl(this._travelRegionsDataSource);

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    return await _travelRegionsDataSource.regions();
  }
}
