import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IceTreaningsRepository)
class IceTreaningsRepositoryImpl implements IceTreaningsRepository {
  @override
  Future<Either<Failure, IceTreaning>> getCurrentTreaning() {
    // TODO: implement getCurrentTreaning
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IceTreaning>> getPreviousTreaning() {
    // TODO: implement getPreviousTreaning
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<IceTreaning>>> getTreaning() {
    // TODO: implement getTreaning
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning}) async {
    return Right(treaning);
  }
}
