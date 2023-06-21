import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class GetTrekkingRegions {
  final TrekkingRepository _trekkingRepository;

  GetTrekkingRegions(this._trekkingRepository);

  Future<Either<Failure, List<Region>>> call() async {
    return await _trekkingRepository.regions();
  }
}
