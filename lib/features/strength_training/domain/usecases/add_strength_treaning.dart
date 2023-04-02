import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_exercises_repository.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddStrengthTreaning {
  final StrengthTreaningsRepository strengthTreaningsRepository;
  final StrengthExerciseRepository strengthExerciseRepository;
  AddStrengthTreaning({
    required this.strengthTreaningsRepository,
    required this.strengthExerciseRepository,
  });

  Future<Either<Failure, StrengthTreaning>> call() async {
    final failureOrSelectedExercises =
        await strengthExerciseRepository.getSelected();

    return failureOrSelectedExercises.fold((failure) => Left(failure),
        (selectedExercises) async {
      final treaning = StrengthTreaning(date: DateTime.now())
        ..startTreaning()
        ..updateExercises(selectedExercises: selectedExercises.keys.toList());

      return await strengthTreaningsRepository.saveTreaning(treaning: treaning);
    });
  }
}
