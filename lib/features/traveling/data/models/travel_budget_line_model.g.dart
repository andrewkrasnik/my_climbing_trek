// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_budget_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelBudgetLineModel _$TravelBudgetLineModelFromJson(
        Map<String, dynamic> json) =>
    TravelBudgetLineModel(
      travelId: json['travelId'] as String,
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
      type: const CostTypeConverter().fromJson(json['type'] as String),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$TravelBudgetLineModelToJson(
        TravelBudgetLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const CostTypeConverter().toJson(instance.type),
      'amount': instance.amount,
      'description': instance.description,
      'travelId': instance.travelId,
    };
