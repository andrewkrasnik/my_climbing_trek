import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';

class TravelBudgetLine extends DataWithUUID {
  final CostType type;
  final double amount;
  final String description;
  final String travelId;

  TravelBudgetLine({
    required this.type,
    required this.amount,
    required this.travelId,
    this.description = '',
    super.id,
  });
}
