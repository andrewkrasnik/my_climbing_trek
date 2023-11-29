import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

abstract class TravelRegionsRepository {
  Future<Either<Failure, List<Region>>> regions();
}
