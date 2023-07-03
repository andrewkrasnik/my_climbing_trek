import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class CurrentTechniqueTreaningUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  CurrentTechniqueTreaningUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, TechniqueTreaning?>> call() async {
    return await _techniqueTreaningsRepository.currentTreaning();
  }
}
