import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';

abstract class TrekkingRepository {
  Future<Either<Failure, List<Region>>> regions();

  Future<Either<Failure, List<Trek>>> treks({required Region region});
}
