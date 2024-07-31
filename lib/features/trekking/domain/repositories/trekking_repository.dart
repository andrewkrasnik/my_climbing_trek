import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

abstract class TrekkingRepository {
  Future<Either<Failure, List<Region>>> regions();

  Future<Either<Failure, List<Trek>>> treks({required Region region});

  Future<Either<Failure, List<TrekPoint>>> points({required Region region});

  Future<Either<Failure, Unit>> saveTrek({
    required Region region,
    required Trek trek,
  });

  Future<Either<Failure, Unit>> deleteTrek({
    required Region region,
    required Trek trek,
  });

  Future<Either<Failure, Unit>> savePoint({
    required Region region,
    required TrekPoint point,
  });

  Future<Either<Failure, Unit>> deletePoint({
    required Region region,
    required TrekPoint point,
  });

  Future<Either<Failure, List<Region>>> myRegions();

  Future<Either<Failure, Unit>> addMyRegion({required Region region});

  Future<Either<Failure, Unit>> deleteMyRegion({required Region region});
}
