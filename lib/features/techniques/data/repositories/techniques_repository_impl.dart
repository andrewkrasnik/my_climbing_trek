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
}
