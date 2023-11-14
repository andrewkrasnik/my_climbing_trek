import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class GetBudgetLinesUsecase {
  final TravelRepository _travelRepository;

  GetBudgetLinesUsecase(this._travelRepository);

  Future<Either<Failure, List<TravelBudgetLine>>> call(
      {required Travel travel}) async {
    return await _travelRepository.getBudgetLines(travel: travel);
  }
}
