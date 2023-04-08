import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

abstract class PlacesRemoteDataSource {
  Future<Either<Failure, List<City>>> cities();

  Future<Either<Failure, List<Region>>> regions();
}
