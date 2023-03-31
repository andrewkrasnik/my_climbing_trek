import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class IceTreaningsDataSource {
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning});
  Future<Either<Failure, List<IceTreaning>>> getTreanings();
  Future<Either<Failure, IceTreaning?>> getCurrentTreaning();
  Future<Either<Failure, IceTreaning?>> getPreviousTreaning();

  Future<Either<Failure, Unit>> deleteTreaning({required IceTreaning treaning});
}

// @LazySingleton(as: IceTreaningsDataSource)
class MockIceTreaningsDataSource implements IceTreaningsDataSource {
  final List<IceTreaning> _treanings = [];
  @override
  Future<Either<Failure, IceTreaning?>> getCurrentTreaning() async {
    // TODO: implement getCurrentTreaning
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IceTreaning?>> getPreviousTreaning() async {
    // TODO: implement getPreviousTreaning
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
    // TODO: implement deleteTreaning
    throw UnimplementedError();
  }
}
