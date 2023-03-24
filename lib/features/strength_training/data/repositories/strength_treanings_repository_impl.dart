import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/data/datasources/strength_treanings_datasource.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';

@LazySingleton(as: StrengthTreaningsRepository)
class StrengthTreaningsRepositoryImpl implements StrengthTreaningsRepository {
  final StrengthTreaningsDataSource strengthTreaningsDataSource;

  StrengthTreaningsRepositoryImpl({
    required this.strengthTreaningsDataSource,
  });

  @override
  Future<Either<Failure, StrengthTreaning?>> currentTreaning() async {
    return await strengthTreaningsDataSource.currentTreaning();
  }

  @override
  Future<Either<Failure, List<StrengthTreaning>>> getTreanings() async {
    return await strengthTreaningsDataSource.getTreanings();
  }

  @override
  Future<Either<Failure, StrengthTreaning?>> previosTreaning() async {
    return await strengthTreaningsDataSource.previosTreaning();
  }

  @override
  Future<Either<Failure, StrengthTreaning>> saveTreaning(
      {required StrengthTreaning treaning}) async {
    return await strengthTreaningsDataSource.saveTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required StrengthTreaning treaning}) async {
    return await strengthTreaningsDataSource.deleteTreaning(treaning: treaning);
  }
}
