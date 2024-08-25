import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton()
class GetTechniquesEditingUsecase {
  final TechniquesRepository _techniquesRepository;

  GetTechniquesEditingUsecase(this._techniquesRepository);

  Future<Either<Failure, bool>> call() async {
    return _techniquesRepository.getEditing();
  }
}
