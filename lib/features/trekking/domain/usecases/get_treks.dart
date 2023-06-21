import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class GetTreks {
  final TrekkingRepository _trekkingRepository;

  GetTreks(this._trekkingRepository);

  Future<Either<Failure, List<Trek>>> call({required Region region}) async {
    return await _trekkingRepository.treks(region: region);
  }
}
