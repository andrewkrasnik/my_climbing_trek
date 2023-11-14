import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';

abstract class EditCostLineIntreface {
  Future<void> editCostLine({
    required Currency currency,
    required IncomeExpense incomeExpense,
    required Travel travel,
    required String description,
    required CostType type,
    double sum = 0,
    DateTime? date,
    String id = '',
  });
}
