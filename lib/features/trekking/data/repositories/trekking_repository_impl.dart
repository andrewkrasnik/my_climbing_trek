import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/datasource/image_cash_manager.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/core/services/network/network_info.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_local_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton(as: TrekkingRepository)
class TrekkingRepositoryImpl implements TrekkingRepository {
  final TrekkingRemoteDataSource _remoteDataSource;
  final TrekkingLocalDataSource _trekkingLocalDataSource;
  final ImageCashManager _imageCashManager;
  final NetworkInfo _networkInfo;

  TrekkingRepositoryImpl(
    this._remoteDataSource,
    this._trekkingLocalDataSource,
    this._imageCashManager,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final failureOrLocalRegions = await _trekkingLocalDataSource.regions();

    return failureOrLocalRegions.fold(
      (failure) => Left(failure),
      (localRegions) async {
        if (await _networkInfo.isConnected) {
          final failureOrRemoteRegions = await _remoteDataSource.regions();

          return failureOrRemoteRegions.fold(
            (failure) => Left(failure),
            (remoteRegions) {
              remoteRegions
                  .removeWhere((element) => localRegions.contains(element));

              final regions = [...localRegions, ...remoteRegions];

              return Right(regions);
            },
          );
        } else {
          return Right(localRegions);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<Trek>>> treks({required Region region}) async {
    if (region.localData) {
      return await _trekkingLocalDataSource.treks(region: region);
    } else {
      return await _remoteDataSource.treks(region: region);
    }
  }

  @override
  Future<Either<Failure, List<TrekPoint>>> points(
      {required Region region}) async {
    if (region.localData) {
      return await _trekkingLocalDataSource.points(region: region);
    } else {
      return await _remoteDataSource.points(region: region);
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePoint(
      {required Region region, required TrekPoint point}) async {
    return await _remoteDataSource.deletePoint(
      region: region,
      point: point,
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteTrek(
      {required Region region, required Trek trek}) async {
    return await _remoteDataSource.deleteTrek(
      region: region,
      trek: trek,
    );
  }

  @override
  Future<Either<Failure, Unit>> savePoint(
      {required Region region, required TrekPoint point}) async {
    return await _remoteDataSource.savePoint(
      region: region,
      point: point,
    );
  }

  @override
  Future<Either<Failure, Unit>> saveTrek(
      {required Region region, required Trek trek}) async {
    return await _remoteDataSource.saveTrek(
      region: region,
      trek: trek,
    );
  }

  @override
  Future<Either<Failure, Unit>> addMyRegion({required Region region}) async {
    final List<String> images = [];

    if (region.image != null) {
      images.add(region.image!);
    }

    final failureOrUnit =
        await _trekkingLocalDataSource.saveRegion(region: region);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) async {
        final failureOrPoints = await _remoteDataSource.points(region: region);

        return failureOrPoints.fold(
          (failure) => Left(failure),
          (points) async {
            final failureOrSaveTreks =
                await _trekkingLocalDataSource.savePoints(
              region: region,
              points: points,
            );

            for (final point in points) {
              if (point.image != null) {
                images.add(point.image!);
              }
            }

            return failureOrSaveTreks.fold(
              (failure) => Left(failure),
              (_) async {
                final failureOrTreks =
                    await _remoteDataSource.treks(region: region);

                return failureOrTreks.fold(
                  (failure) => Left(failure),
                  (treks) async {
                    final failureOrSaveTreks = await _trekkingLocalDataSource
                        .saveTreks(region: region, treks: treks);

                    for (final trek in treks) {
                      if (trek.image != null) {
                        images.add(trek.image!);
                      }
                    }

                    return failureOrSaveTreks.fold(
                      (failure) => Left(failure),
                      (_) async {
                        _imageCashManager.saveImages(
                            cacheKey: region.trekCacheKey, images: images);

                        return const Right(unit);
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteMyRegion({required Region region}) async {
    await _imageCashManager.clear(cacheKey: region.trekCacheKey);

    return _trekkingLocalDataSource.deleteRegion(region: region);
  }

  @override
  Future<Either<Failure, List<Region>>> myRegions() async {
    final failureOrLocalRegions = await _trekkingLocalDataSource.regions();

    return failureOrLocalRegions.fold(
      (failure) => Left(failure),
      (regions) async {
        if (regions.isEmpty) {
          return await _remoteDataSource.regions(limit: 5);
        } else {
          return Right(regions);
        }
      },
    );
  }
}
