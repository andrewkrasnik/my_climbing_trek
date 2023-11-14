import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class DeleteCostLineUsecase {
  final TravelRepository _travelRepository;

  DeleteCostLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required CostLine line,
  }) async {
    return await _travelRepository.deleteCostLine(line: line);
  }
}
