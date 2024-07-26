import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';

abstract class RockRegionsRemoteDataSource {
  Future<Either<Failure, List<RockDistrict>>> districts({int limit = 0});

  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district});

  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
  });

  Future<Either<Failure, Unit>> deleteRoute({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  });

  Future<Either<Failure, Unit>> saveRoute({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  });

  Future<Either<Failure, Unit>> saveSector({
    required RockDistrict district,
    required RockSector sector,
  });

  Future<Either<Failure, Unit>> deleteSector({
    required RockDistrict district,
    required RockSector sector,
  });
}
