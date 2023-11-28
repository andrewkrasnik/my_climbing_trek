import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/technique_treanings_local_datasource.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_treaning_model.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton(as: TechniqueTreaningsRepository)
class TechniqueTreaningsRepositoryImpl implements TechniqueTreaningsRepository {
  final TechniqueTreaningsLocalDataSource _techniqueTreaningsLocalDataSource;

  TechniqueTreaningsRepositoryImpl(this._techniqueTreaningsLocalDataSource);

  @override
  Future<Either<Failure, List<TechniqueTreaning>>> getTreanings() async {
    return await _techniqueTreaningsLocalDataSource.getTreanings();
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required TechniqueTreaning treaning}) async {
    return await _techniqueTreaningsLocalDataSource.deleteTreaning(
        treaning: treaning);
  }

  @override
  Future<Either<Failure, Unit>> saveTreaning(
      {required TechniqueTreaning treaning}) async {
    return await _techniqueTreaningsLocalDataSource.saveTreaning(
        treaning: treaning);
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> currentTreaning() async {
    return await _techniqueTreaningsLocalDataSource.currentTreaning();
  }

  @override
  Future<Either<Failure, TechniqueTreaning?>> previosTreaning() async {
    return await _techniqueTreaningsLocalDataSource.previosTreaning();
  }

  @override
  Future<Either<Failure, Unit>> saveTreaningItem(
      {required TechniqueTreaningItem item}) async {
    return await _techniqueTreaningsLocalDataSource.saveTreaningItem(
        item: item);
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings =
        await _techniqueTreaningsLocalDataSource.getTreanings();

    return failureOrTreanings.fold(
        (failure) => Left(failure),
        (treanings) => Right(treanings.map((treaning) {
              final data = (treaning as TechniqueTreaningModel).toJson();

              return data;
            }).toList()));
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    final treanings = json.map((item) {
      return TechniqueTreaningModel.fromJson(item);
    }).toList();

    for (final treaning in treanings) {
      await _techniqueTreaningsLocalDataSource.saveTreaning(treaning: treaning);

      for (var item in treaning.items) {
        await _techniqueTreaningsLocalDataSource.saveTreaningItem(item: item);
      }
    }
    return const Right(unit);
  }
}
