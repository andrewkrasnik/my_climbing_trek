import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class EditCostLineUsecase {
  final TravelRepository _travelRepository;

  EditCostLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required Currency currency,
    required IncomeExpense incomeExpense,
    required Travel travel,
    required String description,
    required CostType type,
    double sum = 0,
    DateTime? date,
    String id = '',
  }) async {
    final line = CostLine(
      date: date ?? DateTime.now(),
      currency: currency,
      incomeExpense: incomeExpense,
      travelId: travel.id,
      type: type,
      sum: sum,
      budgetSum: currency == travel.budgetCurrency ? sum : 0,
      description: description,
      id: id,
    );

    return await _travelRepository.editCostLine(line: line);
  }
}
