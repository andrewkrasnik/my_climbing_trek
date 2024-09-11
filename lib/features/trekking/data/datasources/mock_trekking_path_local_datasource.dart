import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_path_local_datasource.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';

// @LazySingleton(as: TrekkingPathLocalDataSource)
class MockTrekkingPathLocalDataSource implements TrekkingPathLocalDataSource {
  final List<TrekkingPath> _treanings = [];
  TrekkingPath? _currentTreaning;

  @override
  Future<Either<Failure, List<TrekkingPath>>> treanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, Unit>> savePath({required TrekkingPath path}) async {
    if (!_treanings.contains(path)) {
      _treanings.add(path);
      _currentTreaning = path;
    } else if (_currentTreaning?.finished == true) {
      _currentTreaning = null;
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> savePathEvent(
      {required TrekkingPathEvent event}) async {
    _currentTreaning?.events.add(event);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, TrekkingPath?>> currentPath() async {
    return Right(_currentTreaning);
  }

  @override
  Future<Either<Failure, TrekkingPath?>> previosPath() async {
    TrekkingPath? treaning =
        _treanings.lastWhereOrNull((element) => element != _currentTreaning);

    if (treaning?.currentSection == null) {
      treaning = null;
    }
    return Right(treaning);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TrekkingPath treaning}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TrekkingPath>> getPath({required String pathId}) {
    // TODO: implement getPath
    throw UnimplementedError();
  }
}
