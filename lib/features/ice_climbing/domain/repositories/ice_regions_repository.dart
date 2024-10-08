import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:dartz/dartz.dart';

abstract class IceRegionsRepository {
  Future<Either<Failure, List<IceDistrict>>> getDistricts();

  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district});

  Future<Either<Failure, Unit>> delete({
    required IceSector sector,
    required IceDistrict district,
  });

  Future<Either<Failure, Unit>> save({
    required IceSector sector,
    required IceDistrict district,
  });

  Future<Either<Failure, List<IceDistrict>>> myDistricts();

  Future<Either<Failure, Unit>> addMyDistrict({required IceDistrict district});

  Future<Either<Failure, Unit>> deleteMyDistrict(
      {required IceDistrict district});
}
