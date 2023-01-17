import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:dartz/dartz.dart';

abstract class IceRegionsRepository {
  Future<Either<Failure, List<IceDistrict>>> getDistricts();
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district});
}
