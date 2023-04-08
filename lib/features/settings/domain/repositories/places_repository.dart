import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

abstract class PlacesRepository {
  Region regionById(String id);

  City cityById(String id);

  Future<Either<Failure, Unit>> loadPlaces();

  Future<Either<Failure, Unit>> init();
}
