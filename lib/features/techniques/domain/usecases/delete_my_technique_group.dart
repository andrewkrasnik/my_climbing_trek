import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class DeleteMyTechniqueGroup {
  final TechniquesRepository _techniquesRepository;

  DeleteMyTechniqueGroup(this._techniquesRepository);

  Future<Either<Failure, Unit>> call({required TechniqueGroup group}) async {
    return await _techniquesRepository.deleteMyGroup(group: group);
  }
}
