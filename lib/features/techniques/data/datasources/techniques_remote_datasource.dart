import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

abstract class TechniquesRemoteDataSource {
  Future<Either<Failure, List<TechniqueGroup>>> groups();

  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group});
}
