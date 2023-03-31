import 'package:climbing_diary/core/data/ice_category.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';

@LazySingleton()
class NewIceAttempt {
  final IceTreaningsRepository _iceTreaningsRepository;

  NewIceAttempt(
    this._iceTreaningsRepository,
  );

  Future<Either<Failure, IceTreaningAttempt>> call({
    required IceTreaning treaning,
    required IceSector sector,
    required IceCategory category,
    required ClimbingStyle style,
  }) async {
    final attempt =
        IceTreaningAttempt(sector: sector, category: category, style: style);

    attempt.start();

    treaning.attempts.add(attempt);

    final failureOrTreaning =
        await _iceTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrTreaning.fold(
        (failure) => Left(failure), (_) => Right(attempt));
  }
}
