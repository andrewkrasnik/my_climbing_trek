import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton(as: MountainRegionsRepository)
class MountainRegionsRepositoryImpl implements MountainRegionsRepository {
  final MountainRegionsLocalDataSource _regionsLocalDataSource;

  MountainRegionsRepositoryImpl(this._regionsLocalDataSource);

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    return await _regionsLocalDataSource.regions();
  }

  @override
  Future<Either<Failure, List<Mountain>>> mountains(
      {required Region region}) async {
    return await _regionsLocalDataSource.mountains(region: region);
  }

  @override
  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Mountain mountain}) async {
    return await _regionsLocalDataSource.routes(mountain: mountain);
  }
}
