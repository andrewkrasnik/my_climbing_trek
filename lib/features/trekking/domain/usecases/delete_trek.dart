import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class DeleteTrek {
  final TrekkingRepository _trekkingRepository;

  DeleteTrek(this._trekkingRepository);

  Future<Either<Failure, Unit>> call({
    required Region region,
    required Trek trek,
  }) async {
    return await _trekkingRepository.deleteTrek(region: region, trek: trek);
  }
}
