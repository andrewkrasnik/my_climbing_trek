import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';

abstract class IceTreaningsDataSource {
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning});

  Future<Either<Failure, List<IceTreaning>>> getTreanings();

  Future<Either<Failure, IceTreaning?>> getCurrentTreaning();

  Future<Either<Failure, IceTreaning?>> getPreviousTreaning();

  Future<Either<Failure, Unit>> deleteTreaning({required IceTreaning treaning});

  Future<Either<Failure, Unit>> deleteAttempt(
      {required IceTreaningAttempt attempt});

  Future<Either<Failure, IceTreaning>> getTreaning(
      {required String treaningId});
}

// @LazySingleton(as: IceTreaningsDataSource)
class MockIceTreaningsDataSource implements IceTreaningsDataSource {
  final List<IceTreaning> _treanings = [];
  @override
  Future<Either<Failure, IceTreaning?>> getCurrentTreaning() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IceTreaning?>> getPreviousTreaning() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<IceTreaning>>> getTreanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning}) async {
    if (!_treanings.contains(treaning)) {
      _treanings.add(treaning);
    }
    return Right(treaning);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required IceTreaning treaning}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteAttempt(
      {required IceTreaningAttempt attempt}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IceTreaning>> getTreaning(
      {required String treaningId}) {
    // TODO: implement getTreaning
    throw UnimplementedError();
  }
}
