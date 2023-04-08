import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton(as: RockTreaningsRepository)
class RockTreaningsRepositoryImpl implements RockTreaningsRepository {
  final RockTreaningsLocalDataSource _rockTreaningsLocalDataSource;

  RockTreaningsRepositoryImpl(this._rockTreaningsLocalDataSource);

  @override
  Future<Either<Failure, RockTreaning>> saveTreaning(
      {required RockTreaning treaning}) async {
    return await _rockTreaningsLocalDataSource.saveTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, List<RockTreaning>>> getTreanings() async {
    return await _rockTreaningsLocalDataSource.getTreanings();
  }

  @override
  Future<Either<Failure, RockTreaning?>> getCurrentTreaning() async {
    return await _rockTreaningsLocalDataSource.getCurrentTreaning();
  }

  @override
  Future<Either<Failure, RockTreaning?>> getPreviousTreaning() async {
    return await _rockTreaningsLocalDataSource.getPreviousTreaning();
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required RockTreaning treaning}) async {
    return await _rockTreaningsLocalDataSource.deleteTreaning(
        treaning: treaning);
  }
}