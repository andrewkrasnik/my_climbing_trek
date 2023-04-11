import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton(as: MountainRegionsRepository)
class MountainRegionsRepositoryImpl implements MountainRegionsRepository {
  final MountainRegionsLocalDataSource _regionsLocalDataSource;
  final MountainRegionsRemoteDataSource _regionsRemoteDataSource;

  MountainRegionsRepositoryImpl(
      this._regionsLocalDataSource, this._regionsRemoteDataSource);

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    return await _regionsRemoteDataSource.regions();
  }

  @override
  Future<Either<Failure, List<Mountain>>> mountains(
      {required Region region}) async {
    return await _regionsRemoteDataSource.mountains(region: region);
  }

  @override
  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Region region, required Mountain mountain}) async {
    return await _regionsRemoteDataSource.routes(
        region: region, mountain: mountain);
  }
}
