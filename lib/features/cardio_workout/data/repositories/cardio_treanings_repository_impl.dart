import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/cardio_workout/data/datasources/cardio_treanings_datasource.dart';
import 'package:my_climbing_trek/features/cardio_workout/data/models/cardio_treaning_model.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/repositories/cardio_treanings_repository.dart';

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

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings = await cardioTreaningsDatasource.getTreanings();

    return failureOrTreanings.fold(
        (failure) => Left(failure),
        (treanings) => Right(treanings.map((treaning) {
              final data = (treaning as CardioTreaningModel).toJson();

              return data;
            }).toList()));
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    final treanings = json.map((item) {
      return CardioTreaningModel.fromJson(item);
    }).toList();

    for (final treaning in treanings) {
      await cardioTreaningsDatasource.save(treaning: treaning);
    }
    return const Right(unit);
  }
}
