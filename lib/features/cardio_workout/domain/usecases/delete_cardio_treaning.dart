import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteCardioTreaning {
  final CardioTreaningsRepository cardioTreaningsRepository;
  DeleteCardioTreaning({
    required this.cardioTreaningsRepository,
  });

  Future<Either<Failure, Unit>> call({
    required CardioTreaning treaning,
  }) async {
    return await cardioTreaningsRepository.delete(treaning: treaning);
  }
}
