import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/data/datasources/strength_treanings_datasource.dart';
import 'package:my_climbing_trek/features/strength_training/data/models/strength_treaning_model.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';

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

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings = await strengthTreaningsDataSource.getTreanings();

    return failureOrTreanings.fold(
        (failure) => Left(failure),
        (treanings) => Right(treanings.map((treaning) {
              final data = (treaning as StrengthTreaningModel).toJson();

              return data;
            }).toList()));
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    final treanings = json.map((item) {
      return StrengthTreaningModel.fromJson(item);
    }).toList();

    for (final treaning in treanings) {
      await strengthTreaningsDataSource.saveTreaning(treaning: treaning);
    }
    return const Right(unit);
  }
}
