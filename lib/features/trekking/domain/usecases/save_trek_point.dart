import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_poin_feature.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class SaveTrekPoint {
  final TrekkingRepository _trekkingRepository;

  SaveTrekPoint(this._trekkingRepository);

  Future<Either<Failure, Unit>> call({
    required Region region,
    required String name,
    required MapPoint? mapPoint,
    required int altitude,
    required TrekPointType type,
    required List<TrekPointFeature> features,
    required String description,
    required String id,
    required String? image,
  }) async {
    final point = TrekPoint(
      name: name,
      type: type,
      altitude: altitude,
      description: description,
      features: features,
      id: id,
      image: image,
      mapPoint: mapPoint,
    );

    return await _trekkingRepository.savePoint(region: region, point: point);
  }
}
