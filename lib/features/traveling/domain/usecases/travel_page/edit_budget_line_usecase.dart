import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class EditBudgetLineUsecase {
  final TravelRepository _travelRepository;

  EditBudgetLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required Travel travel,
    required String description,
    required CostType type,
    double amount = 0,
    String id = '',
  }) async {
    final line = TravelBudgetLine(
      travelId: travel.id,
      type: type,
      amount: amount,
      description: description,
      id: id,
    );

    return await _travelRepository.editBudgetLine(line: line);
  }
}
