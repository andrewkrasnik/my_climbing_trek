// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostLineModel _$CostLineModelFromJson(Map<String, dynamic> json) =>
    CostLineModel(
      travelId: json['travelId'] as String,
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
      type: const CostTypeConverter().fromJson(json['type'] as String),
      currency: const CurrencyConverter().fromJson(json['currency'] as int),
      incomeExpense: const IncomeExpenseConverter()
          .fromJson(json['incomeExpense'] as String),
      budgetSum: (json['budgetSum'] as num?)?.toDouble() ?? 0,
      sum: (json['sum'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CostLineModelToJson(CostLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'sum': instance.sum,
      'type': const CostTypeConverter().toJson(instance.type),
      'currency': const CurrencyConverter().toJson(instance.currency),
      'budgetSum': instance.budgetSum,
      'description': instance.description,
      'incomeExpense':
          const IncomeExpenseConverter().toJson(instance.incomeExpense),
      'travelId': instance.travelId,
    };
