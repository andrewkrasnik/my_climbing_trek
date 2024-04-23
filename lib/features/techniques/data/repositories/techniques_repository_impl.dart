import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/techniques_remote_datasource.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton(as: TechniquesRepository)
class TechniquesRepositoryImpl implements TechniquesRepository {
  final TechniquesRemoteDataSource _techniquesRemoteDataSource;

  TechniquesRepositoryImpl(this._techniquesRemoteDataSource);

  @override
  Future<Either<Failure, List<TechniqueGroup>>> groups() async {
    return await _techniquesRemoteDataSource.groups();
  }

  @override
  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group}) async {
    return await _techniquesRemoteDataSource.techniques(group: group);
  }

  @override
  Future<Either<Failure, bool>> getEditing() async {
    return await _techniquesRemoteDataSource.getEditing();
  }

  @override
  Future<Either<Failure, Unit>> delete({
    required Technique technique,
    required TechniqueGroup group,
  }) async {
    return await _techniquesRemoteDataSource.delete(
      technique: technique,
      group: group,
    );
  }

  @override
  Future<Either<Failure, Unit>> save({
    required Technique technique,
    required TechniqueGroup group,
  }) async {
    return await _techniquesRemoteDataSource.save(
      technique: technique,
      group: group,
    );
  }
}
