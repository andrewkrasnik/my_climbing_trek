import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_exercises_repository.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateStrengthTreaningExercises {
  final StrengthTreaningsRepository strengthTreaningsRepository;
  final StrengthExerciseRepository strengthExerciseRepository;
  UpdateStrengthTreaningExercises({
    required this.strengthTreaningsRepository,
    required this.strengthExerciseRepository,
  });

  Future<Either<Failure, StrengthTreaning>> call(
      {required StrengthTreaning treaning}) async {
    final failureOrSelectedExercises =
        await strengthExerciseRepository.getSelected();

    return failureOrSelectedExercises.fold((failure) => Left(failure),
        (selectedExercises) async {
      treaning.updateExercises(
          selectedExercises: selectedExercises.keys.toList());

      return await strengthTreaningsRepository.saveTreaning(treaning: treaning);
    });
  }
}
