// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelModel _$TravelModelFromJson(Map<String, dynamic> json) => TravelModel(
      date: const EpochDateTimeConverter()
          .fromJson((json['date'] as num).toInt()),
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      regions: const RegionsConverter().fromJson(json['regions'] as String),
      name: json['name'] as String,
      image: json['image'] as String,
      budgetCurrency: _$JsonConverterFromJson<int, Currency>(
          json['budgetCurrency'], const CurrencyConverter().fromJson),
      currencies: _$JsonConverterFromJson<String, List<Currency>>(
          json['currencies'], const CurrenciesConverter().fromJson),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      status: json['status'] == null
          ? TravelStatus.planed
          : const TravelStatusConverter().fromJson(json['status'] as String),
    );

Map<String, dynamic> _$TravelModelToJson(TravelModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'regions': const RegionsConverter().toJson(instance.regions),
      'name': instance.name,
      'description': instance.description,
      'currencies': const CurrenciesConverter().toJson(instance.currencies),
      'status': const TravelStatusConverter().toJson(instance.status),
      'budgetCurrency':
          const CurrencyConverter().toJson(instance.budgetCurrency),
      'image': instance.image,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
