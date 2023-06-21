import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class GetTechniqueGroupsUsecase {
  final TechniquesRepository _techniquesRepository;

  GetTechniqueGroupsUsecase(this._techniquesRepository);

  Future<Either<Failure, List<TechniqueGroup>>> call() async {
    return _techniquesRepository.groups();
  }
}
