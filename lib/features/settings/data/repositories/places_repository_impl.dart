import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/core/services/network/network_info.dart';
import 'package:my_climbing_trek/features/settings/data/datasources/places_local_datasource.dart';
import 'package:my_climbing_trek/features/settings/data/datasources/places_remote_datasource.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/places_repository.dart';

@LazySingleton(as: PlacesRepository)
class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesLocalDataSource _localDataSource;
  final PlacesRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  PlacesRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Region regionById(String id) {
    return _localDataSource.regionById(id);
  }

  @override
  City cityById(String id) {
    return _localDataSource.cityById(id);
  }

  @override
  Future<Either<Failure, Unit>> loadPlaces() async {
    await _localDataSource.init();

    if (await _networkInfo.isConnected) {
      final failureOrCities = await _remoteDataSource.cities();

      await failureOrCities.fold(
        (_) async => null,
        (cities) async {
          await _localDataSource.saveCities(cities: cities);
        },
      );

      final failureOrRegions = await _remoteDataSource.regions();

      await failureOrRegions.fold(
        (_) async => null,
        (regions) async {
          _localDataSource.saveRegions(regions: regions);
        },
      );
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> init() async {
    await _localDataSource.init();

    return const Right(unit);
  }
}
