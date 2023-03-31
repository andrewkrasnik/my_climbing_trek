import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/data/datasources/ice_regions_datasource.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_regions_repository.dart';

@LazySingleton(as: IceRegionsRepository)
class IceRegionsRepositoryImpl implements IceRegionsRepository {
  final IceRegionsDataSource iceRegionsDataSource;

  IceRegionsRepositoryImpl({
    required this.iceRegionsDataSource,
  });

  @override
  Future<Either<Failure, List<IceDistrict>>> getDistricts() async {
    return await iceRegionsDataSource.getDistricts();
  }

  @override
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district}) async {
    return await iceRegionsDataSource.getSectors(district: district);
  }
}
