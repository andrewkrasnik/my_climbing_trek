import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';

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
    final attempt = IceTreaningAttempt(
      sector: sector,
      category: category,
      style: style,
      treaningId: treaning.id,
    );

    attempt.start();

    treaning.attempts.add(attempt);

    final failureOrTreaning =
        await _iceTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrTreaning.fold(
        (failure) => Left(failure), (_) => Right(attempt));
  }
}
