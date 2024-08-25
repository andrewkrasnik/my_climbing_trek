import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class AddMyTrekkingRegionUseCase {
  final TrekkingRepository _trekkingRepository;

  AddMyTrekkingRegionUseCase(this._trekkingRepository);

  Future<Either<Failure, Unit>> call({required Region region}) async {
    return _trekkingRepository.addMyRegion(region: region);
  }
}
