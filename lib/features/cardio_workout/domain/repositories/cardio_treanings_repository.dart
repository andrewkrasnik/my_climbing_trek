import 'package:climbing_diary/core/failures/failure.dart';

import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class CardioTreaningsRepository {
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning});
  Future<Either<Failure, Unit>> delete({required CardioTreaning treaning});
  Future<Either<Failure, List<CardioTreaning>>> getTreanings();
}
