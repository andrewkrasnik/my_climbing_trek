// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedingLineModel _$FeedingLineModelFromJson(Map<String, dynamic> json) =>
    FeedingLineModel(
      contacts: _$JsonConverterFromJson<String, List<ContactLine>>(
          json['contacts'], const ContactsConverter().fromJson),
      meal: const MealConverter().fromJson(json['meal'] as String),
      type: const FeedingTypeConverter().fromJson(json['type'] as String),
    );

Map<String, dynamic> _$FeedingLineModelToJson(FeedingLineModel instance) =>
    <String, dynamic>{
      'meal': const MealConverter().toJson(instance.meal),
      'type': const FeedingTypeConverter().toJson(instance.type),
      'contacts': const ContactsConverter().toJson(instance.contacts),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
