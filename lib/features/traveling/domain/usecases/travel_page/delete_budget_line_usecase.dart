import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class DeleteBudgetLineUsecase {
  final TravelRepository _travelRepository;

  DeleteBudgetLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required TravelBudgetLine line,
  }) async {
    return await _travelRepository.deleteBudgetLine(line: line);
  }
}
