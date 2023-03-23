import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/repositories/strength_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetStrengthTreanings {
  final StrengthTreaningsRepository strengthTreaningsRepository;

  GetStrengthTreanings({
    required this.strengthTreaningsRepository,
  });

  Future<Either<Failure, List<StrengthTreaning>>> call() async {
    final failureOrTreanings = await strengthTreaningsRepository.getTreanings();

    return failureOrTreanings.fold(
        (failure) => Left(failure), (treanings) => Right(treanings));
  }
}
