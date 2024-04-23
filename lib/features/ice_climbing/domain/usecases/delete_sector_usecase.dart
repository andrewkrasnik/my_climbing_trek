import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_regions_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@LazySingleton()
class DeleteSectorUseCase {
  final IceRegionsRepository iceRegionsRepository;

  DeleteSectorUseCase({
    required this.iceRegionsRepository,
  });

  Future<Either<Failure, Unit>> call({
    required IceDistrict district,
    required IceSector sector,
  }) async {
    return await iceRegionsRepository.delete(
        district: district, sector: sector);
  }
}
