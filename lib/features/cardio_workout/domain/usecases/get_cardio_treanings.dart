import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCardioTreanings {
  final CardioTreaningsRepository cardioTreaningsRepository;
  GetCardioTreanings({
    required this.cardioTreaningsRepository,
  });

  Future<Either<Failure, List<CardioTreaning>>> call() async {
    return await cardioTreaningsRepository.getTreanings();
  }
}
