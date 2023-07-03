import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class PreviosTechniqueTreaningUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  PreviosTechniqueTreaningUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, TechniqueTreaning?>> call() async {
    return await _techniqueTreaningsRepository.previosTreaning();
  }
}
