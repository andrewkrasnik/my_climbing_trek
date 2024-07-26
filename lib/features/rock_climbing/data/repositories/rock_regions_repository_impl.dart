import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/image_cash_manager.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_routes_filter.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton(as: RockRegionsRepository)
class RockRegionsRepositoryImpl implements RockRegionsRepository {
  final RockRegionsLocalDataSource _regionsLocalDataSource;
  final RockRegionsRemoteDataSource _regionsRemoteDataSource;
  final ImageCashManager _imageCashManager;

  RockRegionsRepositoryImpl(
    this._regionsLocalDataSource,
    this._regionsRemoteDataSource,
    this._imageCashManager,
  );

  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
    final failureOrLocalDistricts = await _regionsLocalDataSource.districts();

    return failureOrLocalDistricts.fold(
      (failure) => Left(failure),
      (localDistricts) async {
        final failureOrRemoteDistricts =
            await _regionsRemoteDataSource.districts();

        return failureOrRemoteDistricts.fold(
          (failure) => Left(failure),
          (remoteDistricts) {
            remoteDistricts
                .removeWhere((element) => localDistricts.contains(element));

            final regions = [...localDistricts, ...remoteDistricts];

            return Right(regions);
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district}) async {
    if (district.localData) {
      return await _regionsLocalDataSource.sectors(district: district);
    } else {
      return await _regionsRemoteDataSource.sectors(district: district);
    }
  }

  @override
  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
    RockRouteFilter? filter,
  }) async {
    if (district.localData) {
      return await _routesFromLocalStorage(
        district: district,
        sector: sector,
        filter: filter,
      );
    } else {
      return await _regionsRemoteDataSource.routes(
        district: district,
        sector: sector,
      );
    }
  }

  Future<Either<Failure, List<RockRoute>>> _routesFromLocalStorage({
    required RockDistrict district,
    required RockSector sector,
    RockRouteFilter? filter,
  }) async {
    final failureOrRoutes = await _regionsLocalDataSource.routes(
        district: district, sector: sector);

    return failureOrRoutes.fold(
        (failure) => Left(failure),
        (routes) => Right(routes
            .where((route) => filter == null ? true : filter.match(route))
            .toList()));
  }

  @override
  Future<Either<Failure, Unit>> deleteRoute({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  }) async {
    return await _regionsRemoteDataSource.deleteRoute(
      district: district,
      sector: sector,
      route: route,
    );
  }

  @override
  Future<Either<Failure, Unit>> saveRoute({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  }) async {
    return await _regionsRemoteDataSource.saveRoute(
      district: district,
      sector: sector,
      route: route,
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteSector({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    return await _regionsRemoteDataSource.deleteSector(
      district: district,
      sector: sector,
    );
  }

  @override
  Future<Either<Failure, Unit>> saveSector({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    return await _regionsRemoteDataSource.saveSector(
      district: district,
      sector: sector,
    );
  }

  @override
  Future<Either<Failure, List<RockDistrict>>> myDistricts() async {
    final failureOrLocalDistrics = await _regionsLocalDataSource.districts();

    return failureOrLocalDistrics.fold(
      (failure) => Left(failure),
      (districts) async {
        if (districts.isEmpty) {
          return await _regionsRemoteDataSource.districts(limit: 5);
        } else {
          return Right(districts);
        }
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> addMyDistrict(
      {required RockDistrict district}) async {
    final List<String> images = [district.image];

    final failureOrUnit =
        await _regionsLocalDataSource.saveDistricts(districts: [district]);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) async {
        final failureOrSectors =
            await _regionsRemoteDataSource.sectors(district: district);

        return failureOrSectors.fold((failure) => Left(failure),
            (sectors) async {
          final failureOrSaveSectors = await _regionsLocalDataSource
              .saveSectors(district: district, sectors: sectors);

          return failureOrSaveSectors.fold((failure) => Left(failure),
              (_) async {
            for (final sector in sectors) {
              images.add(sector.image);

              final failureOrRoutes = await _regionsRemoteDataSource.routes(
                district: district,
                sector: sector,
              );

              await failureOrRoutes.fold((_) async => null, (routes) async {
                await _regionsLocalDataSource.saveRoutes(
                  district: district,
                  sector: sector,
                  routes: routes,
                );
              });
            }

            _imageCashManager.saveImages(
                cacheKey: district.cacheKey, images: images);

            return const Right(unit);
          });
        });
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteMyDistrict(
      {required RockDistrict district}) async {
    await _imageCashManager.clear(cacheKey: district.cacheKey);

    return _regionsLocalDataSource.deleteDistrict(district: district);
  }
}
