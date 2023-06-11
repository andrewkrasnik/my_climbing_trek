import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_path_local_datasource.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton(as: TrekkingPathRepository)
class TrekkingPathRepositoryImpl implements TrekkingPathRepository {
  final TrekkingPathLocalDataSource _pathLocalDataSource;

  TrekkingPathRepositoryImpl(this._pathLocalDataSource);

  @override
  Future<Either<Failure, List<TrekkingPath>>> treanings() async {
    return await _pathLocalDataSource.treanings();
  }

  @override
  Future<Either<Failure, Unit>> savePath({required TrekkingPath path}) async {
    return await _pathLocalDataSource.savePath(path: path);
  }

  @override
  Future<Either<Failure, Unit>> savePathEvent(
      {required TrekkingPathEvent event}) async {
    return await _pathLocalDataSource.savePathEvent(event: event);
  }

  @override
  Future<Either<Failure, TrekkingPath?>> currentPath() async {
    return await _pathLocalDataSource.currentPath();
  }

  @override
  Future<Either<Failure, TrekkingPath?>> previosPath() async {
    return await _pathLocalDataSource.previosPath();
  }
}
