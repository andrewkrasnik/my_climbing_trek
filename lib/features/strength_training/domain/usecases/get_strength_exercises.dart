import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_exercises_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetStrengthExercises {
  final StrengthExerciseRepository strengthExerciseRepository;
  GetStrengthExercises({
    required this.strengthExerciseRepository,
  });

  Future<Either<Failure, Map<StrengthExercise, bool>>> call() async {
    final failureOrExercises = await strengthExerciseRepository.getExercises();

    return failureOrExercises.fold((failure) => Left(failure),
        (exercises) async {
      final failureOrSelectedExercises =
          await strengthExerciseRepository.getSelected();

      return failureOrSelectedExercises.fold(
          (failure) => Left(failure),
          (selectedExercises) => Right({
                for (var element in exercises)
                  element: selectedExercises.containsKey(element)
              }));
    });
  }
}
