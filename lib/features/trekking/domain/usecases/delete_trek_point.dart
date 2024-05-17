import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class DeleteTrekPoint {
  final TrekkingRepository _trekkingRepository;

  DeleteTrekPoint(this._trekkingRepository);

  Future<Either<Failure, Unit>> call({
    required Region region,
    required TrekPoint point,
  }) async {
    return await _trekkingRepository.deletePoint(region: region, point: point);
  }
}
