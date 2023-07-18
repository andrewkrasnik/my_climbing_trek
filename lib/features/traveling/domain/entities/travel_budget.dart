import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';

class TravelBudget {
  final Currency currency;
  final double amount;

  final List<TravelBudgetLine> lines;

  TravelBudget({
    required this.currency,
    required this.amount,
    List<TravelBudgetLine>? lines,
  }) : lines = lines ?? [];
}
