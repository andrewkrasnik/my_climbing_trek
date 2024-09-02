import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/technique_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';

// @LazySingleton(as: TechniqueTreaningsLocalDataSource)
class MockTechniqueTreaningsLocalDataSource
    implements TechniqueTreaningsLocalDataSource {
  final List<TechniqueTreaning> _treanings = [];

  @override
  Future<Either<Failure, List<TechniqueTreaning>>> getTreanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TechniqueTreaning treaning}) async {
    _treanings.remove(treaning);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveTreaning(
      {required TechniqueTreaning treaning}) async {
    if (!_treanings.contains(treaning)) {
      _treanings.add(treaning);
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> currentTreaning() async {
    return Right(_treanings.firstWhereOrNull((element) => !element.finished));
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> previosTreaning() async {
    return Right(_treanings.lastWhereOrNull((element) => element.finished));
  }

  @override
  Future<Either<Failure, Unit>> saveTreaningItem(
      {required TechniqueTreaningItem item}) async {
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaningItem(
      {required TechniqueTreaningItem item}) {
    // TODO: implement deleteTreaningItem
    throw UnimplementedError();
  }
}
