import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/cardio_workout/data/datasources/cardio_treanings_datasource.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';

@LazySingleton(as: CardioTreaningsRepository)
class CardioTreaningsRepositoryImpl implements CardioTreaningsRepository {
  final CardioTreaningsDatasource cardioTreaningsDatasource;

  CardioTreaningsRepositoryImpl({
    required this.cardioTreaningsDatasource,
  });

  @override
  Future<Either<Failure, Unit>> delete(
      {required CardioTreaning treaning}) async {
    return await cardioTreaningsDatasource.delete(treaning: treaning);
  }

  @override
  Future<Either<Failure, CardioTreaning>> save(
      {required CardioTreaning treaning}) async {
    return await cardioTreaningsDatasource.save(treaning: treaning);
  }

  @override
  Future<Either<Failure, List<CardioTreaning>>> getTreanings() async {
    return await cardioTreaningsDatasource.getTreanings();
  }

  @override
  Future<Either<Failure, CardioTreaning?>> lastTreaning() async {
    return await cardioTreaningsDatasource.lastTreaning();
  }
}
