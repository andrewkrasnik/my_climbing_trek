import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class DeleteTechniqueGroupUsecase {
  final TechniquesRepository _techniquesRepository;

  DeleteTechniqueGroupUsecase(this._techniquesRepository);

  Future<Either<Failure, Unit>> call({
    required TechniqueGroup group,
  }) async {
    return _techniquesRepository.deleteGroup(group: group);
  }
}
