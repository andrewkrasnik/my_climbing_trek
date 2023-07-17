import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/local_ascension_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';

@LazySingleton(as: LocalAscensionDataSource)
class MockLocalAscensionDataSource implements LocalAscensionDataSource {
  final List<Ascension> _ascensions = [];

  @override
  Future<Either<Failure, Ascension?>> currentAscention() async {
    return Right(_ascensions.firstWhereOrNull((element) => !element.finished));
  }

  @override
  Future<Either<Failure, List<Ascension>>> getTreanings() async {
    return Right(_ascensions);
  }

  @override
  Future<Either<Failure, Unit>> saveAscention(
      {required Ascension ascension}) async {
    if (!_ascensions.contains(ascension)) {
      _ascensions.add(ascension);
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteAscention(
      {required Ascension ascension}) async {
    _ascensions.remove(ascension);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveAscentionEvent(
      {required AscensionEvent event}) async {
    return const Right(unit);
  }
}
