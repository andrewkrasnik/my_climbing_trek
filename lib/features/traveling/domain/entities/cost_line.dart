import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';

class CostLine {
  final DateTime date;
  final double sum;
  final CostType type;
  final Currency currency;
  final double budgetSum;
  final String description;
  final IncomeExpense incomeExpense;

  CostLine({
    this.sum = 0,
    required this.date,
    required this.type,
    required this.currency,
    required this.incomeExpense,
    this.budgetSum = 0,
    this.description = '',
  });
}

enum IncomeExpense { income, expense }

extension IncomeExpenseExtension on IncomeExpense {
  String get description {
    switch (this) {
      case IncomeExpense.income:
        return 'Доход';
      case IncomeExpense.expense:
        return 'Расход';
    }
  }
}
