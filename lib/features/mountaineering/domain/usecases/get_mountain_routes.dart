import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton()
class GetMountainRoutes {
  final MountainRegionsRepository _mountainRegionsRepository;

  GetMountainRoutes(this._mountainRegionsRepository);

  Future<Either<Failure, List<MountainRoute>>> call(
      {required Region region, required Mountain mountain}) async {
    return _mountainRegionsRepository.routes(
        region: region, mountain: mountain);
  }
}
