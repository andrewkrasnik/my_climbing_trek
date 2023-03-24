import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';
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
