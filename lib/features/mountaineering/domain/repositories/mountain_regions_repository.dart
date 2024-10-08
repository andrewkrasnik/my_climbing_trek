import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';

abstract class MountainRegionsRepository {
  Future<Either<Failure, List<Region>>> regions();

  Future<Either<Failure, List<Mountain>>> mountains({required Region region});

  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Region region, required Mountain mountain});

  Future<Either<Failure, Unit>> saveMountain({required Mountain mountain});

  Future<Either<Failure, Unit>> saveRoute({
    required Mountain mountain,
    required MountainRoute route,
  });

  Future<Either<Failure, List<Region>>> myRegions();

  Future<Either<Failure, Unit>> addMyRegion({required Region region});

  Future<Either<Failure, Unit>> deleteMyRegion({required Region region});

  Future<Either<Failure, Unit>> initListeners({required List<Region> regions});
}
