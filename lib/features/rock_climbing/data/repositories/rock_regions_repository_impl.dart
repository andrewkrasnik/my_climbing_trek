import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/core/services/network/network_info.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton(as: RockRegionsRepository)
class RockRegionsRepositoryImpl implements RockRegionsRepository {
  final RockRegionsLocalDataSource _regionsLocalDataSource;
  final RockRegionsRemoteDataSource _regionsRemoteDataSource;
  final NetworkInfo _networkInfo;

  RockRegionsRepositoryImpl(
    this._regionsLocalDataSource,
    this._regionsRemoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
    if (await _networkInfo.isConnected) {
      final failureOrDistricts = await _regionsRemoteDataSource.districts();

      return await failureOrDistricts.fold((failure) async => Left(failure),
          (districts) async {
        final failureOrUnit =
            await _regionsLocalDataSource.saveDistricts(districts: districts);

        return failureOrUnit.fold((failure) async => Left(failure),
            (_) async => await _regionsLocalDataSource.districts());
      });
    }
    return await _regionsLocalDataSource.districts();
  }

  @override
  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district}) async {
    if (await _networkInfo.isConnected) {
      final failureOrSectors =
          await _regionsRemoteDataSource.sectors(district: district);

      return await failureOrSectors.fold((failure) async => Left(failure),
          (sectors) async {
        final failureOrUnit = await _regionsLocalDataSource.saveSectors(
          district: district,
          sectors: sectors,
        );

        return failureOrUnit.fold(
            (failure) async => Left(failure),
            (_) async =>
                await _regionsLocalDataSource.sectors(district: district));
      });
    }

    return await _regionsLocalDataSource.sectors(district: district);
  }

  @override
  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    if (await _networkInfo.isConnected) {
      final failureOrRoutes = await _regionsRemoteDataSource.routes(
          district: district, sector: sector);

      return await failureOrRoutes.fold((failure) async => Left(failure),
          (routes) async {
        final failureOrUnit = await _regionsLocalDataSource.saveRoutes(
          district: district,
          sector: sector,
          routes: routes,
        );

        return failureOrUnit.fold(
            (failure) async => Left(failure),
            (_) async => await _regionsLocalDataSource.routes(
                district: district, sector: sector));
      });
    }

    return await _regionsLocalDataSource.routes(
        district: district, sector: sector);
  }
}
