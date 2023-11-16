import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';

@LazySingleton()
class FinishIceAttempt {
  final IceTreaningsRepository _iceTreaningsRepository;

  FinishIceAttempt(
    this._iceTreaningsRepository,
  );

  Future<Either<Failure, IceTreaningAttempt>> call({
    required IceTreaning treaning,
    required IceTreaningAttempt attempt,
    required IceCategory category,
    required bool fail,
    required bool downClimbing,
    required int fallCount,
    required int suspensionCount,
    required int toolsCount,
    required int iceScrewsCount,
    required bool installedIceScrews,
    required int length,
  }) async {
    attempt.finish(
      category: category,
      length: length,
      fail: fail,
      downClimbing: downClimbing,
      fallCount: fallCount,
      iceScrewsCount: iceScrewsCount,
      installedIceScrews: installedIceScrews,
      suspensionCount: suspensionCount,
      toolsCount: toolsCount,
    );

    final failureOrTreaning =
        await _iceTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrTreaning.fold(
        (failure) => Left(failure), (_) => Right(attempt));
  }
}
