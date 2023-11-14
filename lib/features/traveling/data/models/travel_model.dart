import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';

part 'travel_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  CurrencyConverter(),
  RegionsConverter(),
  CurrenciesConverter(),
  TravelStatusConverter(),
])
class TravelModel extends Travel {
  TravelModel({
    required super.date,
    super.description,
    super.id,
    super.start,
    required super.regions,
    required super.name,
    required super.image,
    super.budgetCurrency,
    super.currencies,
    super.finish,
    super.status,
  });

  factory TravelModel.fromJson(Map<String, dynamic> json) =>
      _$TravelModelFromJson(json);

  Map<String, dynamic> toJson() => _$TravelModelToJson(this);
}
