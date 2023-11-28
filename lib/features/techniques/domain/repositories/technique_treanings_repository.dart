import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/treanings/domain/repositories/treanings_repository.dart';

abstract class TechniqueTreaningsRepository implements TreaningsRepository {
  @override
  Future<Either<Failure, List<TechniqueTreaning>>> getTreanings();

  Future<Either<Failure, Unit>> deleteTreaning(
      {required TechniqueTreaning treaning});

  Future<Either<Failure, Unit>> saveTreaning(
      {required TechniqueTreaning treaning});

  Future<Either<Failure, Unit>> saveTreaningItem({
    required TechniqueTreaningItem item,
  });

  Future<Either<Failure, TechniqueTreaning?>> currentTreaning();

  Future<Either<Failure, TechniqueTreaning?>> previosTreaning();
}
