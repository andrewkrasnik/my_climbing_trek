import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton()
class GetMyMountainRegions {
  final MountainRegionsRepository _mountainRegionsRepository;

  GetMyMountainRegions(this._mountainRegionsRepository);

  Future<Either<Failure, List<Region>>> call() async {
    return _mountainRegionsRepository.myRegions();
  }
}
