import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

abstract class TechniquesRepository {
  Future<Either<Failure, List<TechniqueGroup>>> groups();

  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group});

  Future<Either<Failure, bool>> getEditing();

  Future<Either<Failure, Unit>> delete({
    required Technique technique,
    required TechniqueGroup group,
  });

  Future<Either<Failure, Unit>> save({
    required Technique technique,
    required TechniqueGroup group,
  });

  Future<Either<Failure, Unit>> deleteGroup({
    required TechniqueGroup group,
  });

  Future<Either<Failure, Unit>> saveGroup({
    required TechniqueGroup group,
  });

  Future<Either<Failure, List<TechniqueGroup>>> myGroups();

  Future<Either<Failure, Unit>> addMyGroup({required TechniqueGroup group});

  Future<Either<Failure, Unit>> deleteMyGroup({required TechniqueGroup group});
}
