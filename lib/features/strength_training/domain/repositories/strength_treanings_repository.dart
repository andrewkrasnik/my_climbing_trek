import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class StrengthTreaningsRepository {
  Future<Either<Failure, List<StrengthTreaning>>> getTreanings();

  Future<Either<Failure, StrengthTreaning?>> currentTreaning();

  Future<Either<Failure, StrengthTreaning?>> previosTreaning();

  Future<Either<Failure, StrengthTreaning>> saveTreaning({
    required StrengthTreaning treaning,
  });
}
