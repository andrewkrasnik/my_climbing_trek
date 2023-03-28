import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:dartz/dartz.dart';

abstract class IceTreaningsRepository {
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning});
  Future<Either<Failure, List<IceTreaning>>> getTreanings();
  Future<Either<Failure, IceTreaning>> getCurrentTreaning();
  Future<Either<Failure, IceTreaning>> getPreviousTreaning();
}
