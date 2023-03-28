import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetLastCardioTreaning {
  final CardioTreaningsRepository cardioTreaningsRepository;
  GetLastCardioTreaning({
    required this.cardioTreaningsRepository,
  });

  Future<Either<Failure, CardioTreaning?>> call() async {
    return await cardioTreaningsRepository.lastTreaning();
  }
}
