import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/treanings/domain/repositories/treanings_repository.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';

abstract class TrekkingPathRepository implements TreaningsRepository {
  @override
  Future<Either<Failure, List<TrekkingPath>>> getTreanings();

  Future<Either<Failure, Unit>> deleteTreaning(
      {required TrekkingPath treaning});

  Future<Either<Failure, Unit>> savePath({required TrekkingPath path});

  Future<Either<Failure, Unit>> savePathEvent(
      {required TrekkingPathEvent event});

  Future<Either<Failure, TrekkingPath?>> currentPath();

  Future<Either<Failure, TrekkingPath?>> previosPath();
}
