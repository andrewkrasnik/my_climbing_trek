import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CardioTreaningsDatasource {
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning});

  Future<Either<Failure, Unit>> delete({required CardioTreaning treaning});

  Future<Either<Failure, List<CardioTreaning>>> getTreanings();

  Future<Either<Failure, CardioTreaning?>> lastTreaning();
}

// @LazySingleton(as: CardioTreaningsDatasource)
class MockCardioTreaningsDatasource implements CardioTreaningsDatasource {
  final List<CardioTreaning> _treanings = [];

  @override
  Future<Either<Failure, Unit>> delete(
      {required CardioTreaning treaning}) async {
    try {
      _treanings.removeWhere((element) => treaning.id == element.id);
    } catch (e) {
      return Left(Failure());
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning}) async {
    if (!_treanings.contains(treaning)) {
      _treanings.add(treaning);
    } else {
      final index =
          _treanings.indexWhere((element) => element.id == treaning.id);
      _treanings[index] = treaning;
    }

    return Right(treaning);
  }

  @override
  Future<Either<Failure, List<CardioTreaning>>> getTreanings() async {
    return Right(_treanings);
  }

  @override
  Future<Either<Failure, CardioTreaning?>> lastTreaning() async {
    return Right(_treanings.lastOrNull);
  }
}
