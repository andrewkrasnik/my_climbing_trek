import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton(as: RockRegionsRepository)
class RockRegionsRepositoryImpl implements RockRegionsRepository {
  final RockRegionsLocalDataSource _regionsLocalDataSource;

  RockRegionsRepositoryImpl(this._regionsLocalDataSource);

  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
    return await _regionsLocalDataSource.districts();
  }

  @override
  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district}) async {
    return await _regionsLocalDataSource.sectors(district: district);
  }

  @override
  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    return await _regionsLocalDataSource.routes(
        district: district, sector: sector);
  }
}
