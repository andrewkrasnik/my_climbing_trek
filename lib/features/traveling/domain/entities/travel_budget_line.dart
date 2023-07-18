import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';

class TravelBudgetLine {
  final CostType type;
  final double amount;
  final String description;

  TravelBudgetLine({
    required this.type,
    required this.amount,
    this.description = '',
  });
}
