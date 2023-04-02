import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class CardioTreaningsRepository {
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning});

  Future<Either<Failure, Unit>> delete({required CardioTreaning treaning});

  Future<Either<Failure, List<CardioTreaning>>> getTreanings();

  Future<Either<Failure, CardioTreaning?>> lastTreaning();
}
