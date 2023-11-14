import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';

part 'cost_line_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  CostTypeConverter(),
  CurrencyConverter(),
  IncomeExpenseConverter(),
])
class CostLineModel extends CostLine {
  CostLineModel({
    required super.travelId,
    required super.date,
    super.description,
    super.id,
    required super.type,
    required super.currency,
    required super.incomeExpense,
    super.budgetSum,
    super.sum,
  });

  factory CostLineModel.fromJson(Map<String, dynamic> json) =>
      _$CostLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$CostLineModelToJson(this);
}
