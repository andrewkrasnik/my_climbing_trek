import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';

part 'travel_budget_line_model.g.dart';

@JsonSerializable(converters: [
  CostTypeConverter(),
])
class TravelBudgetLineModel extends TravelBudgetLine {
  TravelBudgetLineModel({
    required super.travelId,
    super.description,
    super.id,
    required super.type,
    required super.amount,
  });

  factory TravelBudgetLineModel.fromJson(Map<String, dynamic> json) =>
      _$TravelBudgetLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$TravelBudgetLineModelToJson(this);
}
