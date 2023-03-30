import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FinishStrengthTreaning {
  final StrengthTreaningsRepository strengthTreaningsRepository;
  FinishStrengthTreaning({
    required this.strengthTreaningsRepository,
  });

  Future<Either<Failure, StrengthTreaning>> call({
    required StrengthTreaning treaning,
  }) async {
    treaning.finishTreaning();

    return await strengthTreaningsRepository.saveTreaning(treaning: treaning);
  }
}
