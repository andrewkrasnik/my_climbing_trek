import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CardioTreaningsDatasource {
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning});
  Future<Either<Failure, Unit>> delete({required CardioTreaning treaning});
  Future<Either<Failure, List<CardioTreaning>>> getTreanings();
}

@LazySingleton(as: CardioTreaningsDatasource)
class MockCardioTreaningsDatasource implements CardioTreaningsDatasource {
  final List<CardioTreaning> _treanings = [];
  int _idCounter = 0;

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
    if (treaning.id == null) {
      _idCounter++;
      treaning.id = _idCounter;
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
}
