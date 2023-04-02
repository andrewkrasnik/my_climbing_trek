import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddRepetitionForStrengthTreaning {
  final StrengthTreaningsRepository strengthTreaningsRepository;
  AddRepetitionForStrengthTreaning({
    required this.strengthTreaningsRepository,
  });

  Future<Either<Failure, StrengthTreaning>> call({
    required StrengthTreaning treaning,
    required StrengthExercise exercise,
    required int count,
  }) async {
    final item = treaning.excercises
        .firstWhere((element) => element.exercise == exercise);

    item.repetitions.add(count);

    return await strengthTreaningsRepository.saveTreaning(treaning: treaning);
  }
}
