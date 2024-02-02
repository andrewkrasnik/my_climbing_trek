import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_path_local_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trekking_path_model.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton(as: TrekkingPathRepository)
class TrekkingPathRepositoryImpl implements TrekkingPathRepository {
  final TrekkingPathLocalDataSource _pathLocalDataSource;

  TrekkingPathRepositoryImpl(this._pathLocalDataSource);

  @override
  Future<Either<Failure, List<TrekkingPath>>> getTreanings() async {
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

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TrekkingPath treaning}) async {
    return await _pathLocalDataSource.deleteTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings = await _pathLocalDataSource.treanings();

    return failureOrTreanings.fold(
        (failure) => Left(failure),
        (treanings) => Right(treanings.map((treaning) {
              final data = (treaning as TrekkingPathModel).toJson();

              return data;
            }).toList()));
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    final treanings = json.map((item) {
      return TrekkingPathModel.fromJson(item);
    }).toList();

    for (final treaning in treanings) {
      await _pathLocalDataSource.savePath(path: treaning);

      for (var item in treaning.events) {
        await _pathLocalDataSource.savePathEvent(event: item);
      }
    }
    return const Right(unit);
  }
}
