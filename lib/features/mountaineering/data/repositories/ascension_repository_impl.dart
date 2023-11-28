import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/local_ascension_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/ascension_model.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';

@LazySingleton(as: AscensionRepository)
class AscensionRepositoryImpl implements AscensionRepository {
  final LocalAscensionDataSource _localAscensionDataSource;

  AscensionRepositoryImpl(this._localAscensionDataSource);
  @override
  Future<Either<Failure, Ascension?>> currentAscention() async {
    return await _localAscensionDataSource.currentAscention();
  }

  @override
  Future<Either<Failure, List<Ascension>>> getTreanings() async {
    return await _localAscensionDataSource.getTreanings();
  }

  @override
  Future<Either<Failure, Unit>> saveAscention(
      {required Ascension ascension}) async {
    return await _localAscensionDataSource.saveAscention(ascension: ascension);
  }

  @override
  Future<Either<Failure, Unit>> deleteAscention(
      {required Ascension ascension}) async {
    return await _localAscensionDataSource.deleteAscention(
        ascension: ascension);
  }

  @override
  Future<Either<Failure, Unit>> saveAscentionEvent(
      {required AscensionEvent event}) async {
    return await _localAscensionDataSource.saveAscentionEvent(event: event);
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings = await _localAscensionDataSource.getTreanings();

    return failureOrTreanings.fold(
        (failure) => Left(failure),
        (treanings) => Right(treanings.map((treaning) {
              final data = (treaning as AscensionModel).toJson();

              return data;
            }).toList()));
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    final treanings = json.map((item) {
      return AscensionModel.fromJson(item);
    }).toList();

    for (final treaning in treanings) {
      await _localAscensionDataSource.saveAscention(ascension: treaning);

      for (var item in treaning.events) {
        await _localAscensionDataSource.saveAscentionEvent(event: item);
      }
    }
    return const Right(unit);
  }
}
