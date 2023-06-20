import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';

abstract class TravelLocalDatasource {
  Future<Either<Failure, Travel?>> currentTravel();

  Future<Either<Failure, Unit>> saveTravel({required Travel travel});

  Future<Either<Failure, Unit>> deleteTravel({required Travel travel});

  Future<Either<Failure, List<Travel>>> getTreanings();

  Future<Either<Failure, List<Travel>>> getPlanedTravels();

  Future<Either<Failure, List<Travel>>> getTravels();
}