import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class GetTrekPoints {
  final TrekkingRepository _trekkingRepository;

  GetTrekPoints(this._trekkingRepository);

  Future<Either<Failure, List<TrekPoint>>> call(
      {required Region region}) async {
    return await _trekkingRepository.points(region: region);
  }
}
