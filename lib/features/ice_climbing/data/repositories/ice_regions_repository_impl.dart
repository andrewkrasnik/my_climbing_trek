import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/image_cash_manager.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/core/services/network/network_info.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_regions_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_regions_repository.dart';

@LazySingleton(as: IceRegionsRepository)
class IceRegionsRepositoryImpl implements IceRegionsRepository {
  final IceRegionsDataSource _regionsLocalDataSource;
  final IceRegionsRemoteDataSource _regionsRemoteDataSource;
  final NetworkInfo _networkInfo;
  final ImageCashManager _imageCashManager;

  IceRegionsRepositoryImpl(
    this._regionsLocalDataSource,
    this._regionsRemoteDataSource,
    this._networkInfo,
    this._imageCashManager,
  );

  @override
  Future<Either<Failure, List<IceDistrict>>> getDistricts() async {
    if (await _networkInfo.isConnected) {
      final failureOrDistricts = await _regionsRemoteDataSource.districts();

      return await failureOrDistricts.fold((failure) async => Left(failure),
          (districts) async {
        final failureOrUnit =
            await _regionsLocalDataSource.saveDistricts(districts: districts);

        return failureOrUnit.fold((failure) async => Left(failure),
            (_) async => await _regionsLocalDataSource.getDistricts());
      });
    }

    return await _regionsLocalDataSource.getDistricts();
  }

  @override
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district}) async {
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
                await _regionsLocalDataSource.getSectors(district: district));
      });
    }
    return await _regionsLocalDataSource.getSectors(district: district);
  }

  @override
  Future<Either<Failure, Unit>> delete({
    required IceSector sector,
    required IceDistrict district,
  }) async {
    return await _regionsRemoteDataSource.delete(
      sector: sector,
      district: district,
    );
  }

  @override
  Future<Either<Failure, Unit>> save({
    required IceSector sector,
    required IceDistrict district,
  }) async {
    return await _regionsRemoteDataSource.save(
      sector: sector,
      district: district,
    );
  }

  @override
  Future<Either<Failure, Unit>> addMyDistrict(
      {required IceDistrict district}) async {
    final List<String> images = [district.image];

    final failureOrUnit =
        await _regionsLocalDataSource.saveDistricts(districts: [district]);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) async {
        final failureOrSectors =
            await _regionsRemoteDataSource.sectors(district: district);

        return failureOrSectors.fold(
          (failure) => Left(failure),
          (sectors) async {
            final failureOrSaveSectors = await _regionsLocalDataSource
                .saveSectors(district: district, sectors: sectors);

            return failureOrSaveSectors.fold(
              (failure) => Left(failure),
              (_) async {
                for (final sector in sectors) {
                  images.add(sector.image);
                }

                _imageCashManager.saveImages(
                    cacheKey: district.cacheKey, images: images);

                return const Right(unit);
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteMyDistrict(
      {required IceDistrict district}) async {
    await _imageCashManager.clear(cacheKey: district.cacheKey);

    return _regionsLocalDataSource.deleteDistrict(district: district);
  }

  @override
  Future<Either<Failure, List<IceDistrict>>> myDistricts() async {
    final failureOrLocalRegions = await _regionsLocalDataSource.getDistricts();

    return failureOrLocalRegions.fold(
      (failure) => Left(failure),
      (regions) async {
        if (regions.isEmpty) {
          return await _regionsRemoteDataSource.districts(limit: 5);
        } else {
          return Right(regions);
        }
      },
    );
  }
}
