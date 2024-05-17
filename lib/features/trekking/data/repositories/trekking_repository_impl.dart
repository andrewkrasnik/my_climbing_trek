import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton(as: TrekkingRepository)
class TrekkingRepositoryImpl implements TrekkingRepository {
  final TrekkingRemoteDataSource _remoteDataSource;

  TrekkingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    return await _remoteDataSource.regions();
  }

  @override
  Future<Either<Failure, List<Trek>>> treks({required Region region}) async {
    return await _remoteDataSource.treks(region: region);
  }

  @override
  Future<Either<Failure, List<TrekPoint>>> points(
      {required Region region}) async {
    return await _remoteDataSource.points(region: region);
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
}
