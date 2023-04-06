import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class NewRockAttempt {
  final RockTreaningsRepository _rockTreaningsRepository;

  NewRockAttempt(
    this._rockTreaningsRepository,
  );

  Future<Either<Failure, RockTreaningAttempt>> call({
    required RockTreaning treaning,
    required RockSector sector,
    required ClimbingCategory category,
    required ClimbingStyle style,
    RockRoute? route,
  }) async {
    final attempt = RockTreaningAttempt(
      sector: sector,
      category: category,
      style: style,
      route: route,
    );

    attempt.start();

    treaning.attempts.add(attempt);

    final failureOrTreaning =
        await _rockTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrTreaning.fold(
        (failure) => Left(failure), (_) => Right(attempt));
  }
}
