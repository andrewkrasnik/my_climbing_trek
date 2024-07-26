import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';

abstract class RockRegionsLocalDataSource {
  Future<Either<Failure, List<RockDistrict>>> districts();

  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district});

  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
  });

  Future<Either<Failure, Unit>> saveDistricts(
      {required List<RockDistrict> districts});

  Future<Either<Failure, Unit>> saveSectors({
    required RockDistrict district,
    required List<RockSector> sectors,
  });

  Future<Either<Failure, Unit>> saveRoutes({
    required RockDistrict district,
    required RockSector sector,
    required List<RockRoute> routes,
  });

  Future<Either<Failure, Unit>> deleteDistrict(
      {required RockDistrict district});
}
