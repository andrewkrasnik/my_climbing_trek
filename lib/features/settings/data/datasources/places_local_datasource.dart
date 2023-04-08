import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

abstract class PlacesLocalDataSource {
  Future<Either<Failure, List<City>>> cities();

  Future<Either<Failure, List<Region>>> regions();

  Region regionById(String id);

  City cityById(String id);

  Future<Either<Failure, Unit>> saveCities({required List<City> cities});

  Future<Either<Failure, Unit>> saveRegions({required List<Region> regions});

  Future<Either<Failure, Unit>> init();
}
