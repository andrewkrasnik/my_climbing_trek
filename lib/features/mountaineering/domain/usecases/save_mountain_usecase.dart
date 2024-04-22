import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton()
class SaveMountainUsecase {
  final MountainRegionsRepository _mountainRegionsRepository;

  SaveMountainUsecase(this._mountainRegionsRepository);

  Future<Either<Failure, Unit>> call({
    required Region region,
    required String id,
    required String name,
    required String image,
    required int altitude,
  }) async {
    final mountain = Mountain(
      region: region,
      name: name,
      altitude: altitude,
      image: image,
      id: id,
    );

    return _mountainRegionsRepository.saveMountain(mountain: mountain);
  }
}
