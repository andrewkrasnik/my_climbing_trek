import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class StrengthTreaningsDataSource {
  Future<Either<Failure, List<StrengthTreaning>>> getTreanings();

  Future<Either<Failure, StrengthTreaning?>> currentTreaning();

  Future<Either<Failure, StrengthTreaning?>> previosTreaning();

  Future<Either<Failure, StrengthTreaning>> saveTreaning({
    required StrengthTreaning treaning,
  });

  Future<Either<Failure, Unit>> deleteTreaning({
    required StrengthTreaning treaning,
  });
}

// @LazySingleton(as: StrengthTreaningsDataSource)
class MockStrengthTreaningsDataSource implements StrengthTreaningsDataSource {
  final List<StrengthTreaning> _treanings = [];
  @override
  Future<Either<Failure, StrengthTreaning?>> currentTreaning() async {
    return Right(_treanings.firstWhereOrNull((element) => element.started));
  }

  @override
  Future<Either<Failure, List<StrengthTreaning>>> getTreanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, StrengthTreaning?>> previosTreaning() async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, StrengthTreaning>> saveTreaning(
      {required StrengthTreaning treaning}) async {
    final index = _treanings.indexWhere((element) => element.id == treaning.id);

    if (index == -1) {
      _treanings.add(treaning);
    } else {
      _treanings[index] = treaning;
    }

    return Right(treaning);
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required StrengthTreaning treaning}) async {
    _treanings.remove(treaning);
    return const Right(unit);
  }
}
