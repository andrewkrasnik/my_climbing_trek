import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class SaveTechniqueUsecase {
  final TechniquesRepository _techniquesRepository;

  SaveTechniqueUsecase(this._techniquesRepository);

  Future<Either<Failure, Unit>> call({
    required TechniqueGroup group,
    required String name,
    required String id,
    required String description,
    String? image,
    List<TechniqueOption>? options,
    List<String>? links,
  }) async {
    final technique = Technique(
      name: name,
      description: description,
      id: id,
      image: image,
      links: links,
      options: options,
    );
    return _techniquesRepository.save(group: group, technique: technique);
  }
}
