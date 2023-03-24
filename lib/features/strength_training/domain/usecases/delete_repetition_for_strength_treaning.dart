import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteRepetitionForStrengthTreaning {
  final StrengthTreaningsRepository strengthTreaningsRepository;
  DeleteRepetitionForStrengthTreaning({
    required this.strengthTreaningsRepository,
  });

  Future<Either<Failure, StrengthTreaning>> call({
    required StrengthTreaning treaning,
    required StrengthExercise exercise,
  }) async {
    final item = treaning.excercises
        .firstWhere((element) => element.exercise == exercise);

    if (item.repetitions.isNotEmpty) {
      item.repetitions.removeLast();

      return await strengthTreaningsRepository.saveTreaning(treaning: treaning);
    }
    return Right(treaning);
  }
}
