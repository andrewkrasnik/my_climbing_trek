import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class DeleteTechniqueUsecase {
  final TechniquesRepository _techniquesRepository;

  DeleteTechniqueUsecase(this._techniquesRepository);

  Future<Either<Failure, Unit>> call({
    required TechniqueGroup group,
    required Technique technique,
  }) async {
    return _techniquesRepository.delete(group: group, technique: technique);
  }
}
