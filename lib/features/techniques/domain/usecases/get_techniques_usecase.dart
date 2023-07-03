import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class GetTechniquesUsecase {
  final TechniquesRepository _techniquesRepository;

  GetTechniquesUsecase(this._techniquesRepository);

  Future<Either<Failure, List<Technique>>> call(
      {required TechniqueGroup group}) async {
    return _techniquesRepository.techniques(group: group);
  }
}
