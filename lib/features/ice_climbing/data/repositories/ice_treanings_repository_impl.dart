import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_treanings_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IceTreaningsRepository)
class IceTreaningsRepositoryImpl implements IceTreaningsRepository {
  final IceTreaningsDataSource _iceTreaningsDataSource;

  IceTreaningsRepositoryImpl(this._iceTreaningsDataSource);
  @override
  Future<Either<Failure, IceTreaning?>> getCurrentTreaning() async {
    return await _iceTreaningsDataSource.getCurrentTreaning();
  }

  @override
  Future<Either<Failure, IceTreaning?>> getPreviousTreaning() async {
    return await _iceTreaningsDataSource.getPreviousTreaning();
  }

  @override
  Future<Either<Failure, List<IceTreaning>>> getTreanings() async {
    return await _iceTreaningsDataSource.getTreanings();
  }

  @override
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning}) async {
    return await _iceTreaningsDataSource.saveTreaning(treaning: treaning);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required IceTreaning treaning}) async {
    return await _iceTreaningsDataSource.deleteTreaning(treaning: treaning);
  }
}
