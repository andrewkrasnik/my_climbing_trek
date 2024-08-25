import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

abstract class IceRegionsRemoteDataSource {
  Future<Either<Failure, List<IceDistrict>>> districts({int limit = 0});

  Future<Either<Failure, List<IceSector>>> sectors(
      {required IceDistrict district});

  Future<Either<Failure, Unit>> delete({
    required IceDistrict district,
    required IceSector sector,
  });

  Future<Either<Failure, Unit>> save({
    required IceDistrict district,
    required IceSector sector,
  });
}
