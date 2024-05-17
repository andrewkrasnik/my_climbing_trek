import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class SaveTechniqueGroupUsecase {
  final TechniquesRepository _techniquesRepository;

  SaveTechniqueGroupUsecase(this._techniquesRepository);

  Future<Either<Failure, Unit>> call({
    required String name,
    required String id,
    required String description,
    required String image,
  }) async {
    final group = TechniqueGroup(
      name: name,
      description: description,
      image: image,
      id: id,
    );

    return _techniquesRepository.saveGroup(group: group);
  }
}
