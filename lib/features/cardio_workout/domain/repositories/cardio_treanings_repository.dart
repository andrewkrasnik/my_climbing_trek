import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/treanings/domain/repositories/treanings_repository.dart';

abstract class CardioTreaningsRepository implements TreaningsRepository {
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning});

  Future<Either<Failure, Unit>> delete({required CardioTreaning treaning});

  @override
  Future<Either<Failure, List<CardioTreaning>>> getTreanings();

  Future<Either<Failure, CardioTreaning?>> lastTreaning();
}
