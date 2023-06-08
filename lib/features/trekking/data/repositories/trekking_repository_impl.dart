import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
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
}
