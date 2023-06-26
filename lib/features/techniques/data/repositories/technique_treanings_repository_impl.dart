import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/technique_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton(as: TechniqueTreaningsRepository)
class TechniqueTreaningsRepositoryImpl implements TechniqueTreaningsRepository {
  final TechniqueTreaningsLocalDataSource _techniqueTreaningsLocalDataSource;

  TechniqueTreaningsRepositoryImpl(this._techniqueTreaningsLocalDataSource);

  @override
  Future<Either<Failure, List<TechniqueTreaning>>> getTreanings() async {
    return _techniqueTreaningsLocalDataSource.getTreanings();
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TechniqueTreaning treaning}) async {
    return _techniqueTreaningsLocalDataSource.deleteTreaning(
        treaning: treaning);
  }

  @override
  Future<Either<Failure, Unit>> saveTreaning(
      {required TechniqueTreaning treaning}) async {
    return _techniqueTreaningsLocalDataSource.saveTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> currentTreaning() async {
    return _techniqueTreaningsLocalDataSource.currentTreaning();
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> previosTreaning() async {
    return _techniqueTreaningsLocalDataSource.previosTreaning();
  }
}
