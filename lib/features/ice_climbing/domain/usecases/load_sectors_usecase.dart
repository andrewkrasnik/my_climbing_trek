import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_regions_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@LazySingleton()
class LoadSectorsUseCase {
  final IceRegionsRepository iceRegionsRepository;

  LoadSectorsUseCase({
    required this.iceRegionsRepository,
  });

  Future<Either<Failure, List<IceSector>>> call(
      {required IceDistrict district}) async {
    return await iceRegionsRepository.getSectors(district: district);
  }
}
