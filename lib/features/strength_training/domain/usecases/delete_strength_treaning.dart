import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteStrengthTreaning {
  final StrengthTreaningsRepository strengthTreaningsRepository;
  DeleteStrengthTreaning({
    required this.strengthTreaningsRepository,
  });

  Future<Either<Failure, Unit>> call(
      {required StrengthTreaning treaning}) async {
    return await strengthTreaningsRepository.deleteTreaning(treaning: treaning);
  }
}
