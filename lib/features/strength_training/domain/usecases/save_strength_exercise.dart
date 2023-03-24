import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_exercises_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveStrengthExercise {
  final StrengthExerciseRepository strengthExerciseRepository;
  SaveStrengthExercise({
    required this.strengthExerciseRepository,
  });

  Future<Either<Failure, StrengthExercise>> call({
    required String name,
    required int repetitions,
    String? id,
  }) async {
    final StrengthExercise exercise =
        StrengthExercise(name: name, repetitions: repetitions, id: id ?? '');

    return await strengthExerciseRepository.saveExercise(exercise: exercise);
  }
}
