import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton()
class DeleteMyMountainRegionUseCase {
  final MountainRegionsRepository _mountainRegionsRepository;

  DeleteMyMountainRegionUseCase(this._mountainRegionsRepository);

  Future<Either<Failure, Unit>> call({required Region region}) async {
    return _mountainRegionsRepository.deleteMyRegion(region: region);
  }
}