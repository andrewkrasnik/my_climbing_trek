import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/treanings/domain/repositories/treanings_repository.dart';

abstract class StrengthTreaningsRepository implements TreaningsRepository {
  @override
  Future<Either<Failure, List<StrengthTreaning>>> getTreanings();

  Future<Either<Failure, StrengthTreaning?>> currentTreaning();

  Future<Either<Failure, StrengthTreaning?>> previosTreaning();

  Future<Either<Failure, StrengthTreaning>> saveTreaning({
    required StrengthTreaning treaning,
  });

  Future<Either<Failure, Unit>> deleteTreaning({
    required StrengthTreaning treaning,
  });
}
