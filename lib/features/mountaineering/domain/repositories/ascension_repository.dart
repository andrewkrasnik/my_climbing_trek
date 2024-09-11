import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';
import 'package:my_climbing_trek/features/treanings/domain/repositories/treanings_repository.dart';

abstract class AscensionRepository implements TreaningsRepository {
  Future<Either<Failure, Ascension?>> currentAscention();

  Future<Either<Failure, Ascension>> getAscention({required String id});

  @override
  Future<Either<Failure, List<Ascension>>> getTreanings();

  Future<Either<Failure, Unit>> saveAscention({required Ascension ascension});

  Future<Either<Failure, Unit>> saveAscentionEvent(
      {required AscensionEvent event});

  Future<Either<Failure, Unit>> deleteAscention({required Ascension ascension});
}
