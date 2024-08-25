import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

abstract class TechniquesLocalDataSource {
  Future<Either<Failure, List<TechniqueGroup>>> groups({int limit = 0});

  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group});

  Future<Either<Failure, Unit>> deleteGroup({
    required TechniqueGroup group,
  });

  Future<Either<Failure, Unit>> saveGroup({
    required TechniqueGroup group,
  });

  Future<Either<Failure, Unit>> saveTechniques({
    required TechniqueGroup group,
    required List<Technique> techniques,
  });
}
