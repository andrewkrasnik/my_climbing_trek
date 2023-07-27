import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class GetCostLinesUsecase {
  final TravelRepository _travelRepository;

  GetCostLinesUsecase(this._travelRepository);

  Future<Either<Failure, List<CostLine>>> call({required Travel travel}) async {
    return await _travelRepository.getCostLines(travel: travel);
  }
}
