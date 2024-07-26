import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/datasource/image_cash_manager.dart';
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
  final ImageCashManager _imageCashManager;

  MountainRegionsRepositoryImpl(
    this._regionsLocalDataSource,
    this._regionsRemoteDataSource,
    this._imageCashManager,
  );

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final failureOrLocalRegions = await _regionsLocalDataSource.regions();

    return failureOrLocalRegions.fold(
      (failure) => Left(failure),
      (localRegions) async {
        final failureOrRemoteRegions = await _regionsRemoteDataSource.regions();

        return failureOrRemoteRegions.fold(
          (failure) => Left(failure),
          (remoteRegions) {
            remoteRegions
                .removeWhere((element) => localRegions.contains(element));

            final regions = [...localRegions, ...remoteRegions];

            return Right(regions);
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, List<Mountain>>> mountains(
      {required Region region}) async {
    if (region.localData) {
      return await _regionsLocalDataSource.mountains(region: region);
    } else {
      return await _regionsRemoteDataSource.mountains(region: region);
    }
  }

  @override
  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Region region, required Mountain mountain}) async {
    if (region.localData) {
      return await _regionsLocalDataSource.routes(
        region: region,
        mountain: mountain,
      );
    } else {
      return await _regionsRemoteDataSource.routes(
          region: region, mountain: mountain);
    }
  }

  @override
  Future<Either<Failure, Unit>> saveMountain(
      {required Mountain mountain}) async {
    return await _regionsRemoteDataSource.saveMountain(mountain: mountain);
  }

  @override
  Future<Either<Failure, Unit>> saveRoute(
      {required Mountain mountain, required MountainRoute route}) async {
    return await _regionsRemoteDataSource.saveRoute(
      mountain: mountain,
      route: route,
    );
  }

  @override
  Future<Either<Failure, List<Region>>> myRegions() async {
    final failureOrLocalRegions = await _regionsLocalDataSource.regions();

    return failureOrLocalRegions.fold(
      (failure) => Left(failure),
      (regions) async {
        if (regions.isEmpty) {
          return await _regionsRemoteDataSource.regions(limit: 5);
        } else {
          return Right(regions);
        }
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> addMyRegion({required Region region}) async {
    final List<String> images = [];

    if (region.image != null) {
      images.add(region.image!);
    }

    final failureOrUnit =
        await _regionsLocalDataSource.saveRegion(region: region);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) async {
        final failureOrMountains =
            await _regionsRemoteDataSource.mountains(region: region);

        return failureOrMountains.fold((failure) => Left(failure),
            (mountains) async {
          final failureOrSaveMountains = await _regionsLocalDataSource
              .saveMountains(region: region, mountains: mountains);

          return failureOrSaveMountains.fold((failure) => Left(failure),
              (_) async {
            for (final mountain in mountains) {
              images.add(mountain.image);

              final failureOrRoutes = await _regionsRemoteDataSource.routes(
                region: region,
                mountain: mountain,
              );

              await failureOrRoutes.fold((_) async => null, (routes) async {
                await _regionsLocalDataSource.saveRoutes(
                  region: region,
                  mountain: mountain,
                  routes: routes,
                );

                for (final route in routes) {
                  if (route.image != null) {
                    images.add(route.image!);
                  }

                  if (route.ueaaSchemaImage != null) {
                    images.add(route.ueaaSchemaImage!);
                  }
                }
              });
            }

            _imageCashManager.saveImages(
                cacheKey: region.cacheKey, images: images);

            return const Right(unit);
          });
        });
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteMyRegion({required Region region}) async {
    await _imageCashManager.clear(cacheKey: region.cacheKey);

    return _regionsLocalDataSource.deleteRegion(region: region);
  }

  @override
  Future<Either<Failure, Unit>> initListeners({required List<Region> regions}) {
    // TODO: implement initListeners
    throw UnimplementedError();
  }
}
