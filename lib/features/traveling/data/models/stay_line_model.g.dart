// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stay_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StayLineModel _$StayLineModelFromJson(Map<String, dynamic> json) =>
    StayLineModel(
      type: const StayTypeConverter().fromJson(json['type'] as String),
      contacts: _$JsonConverterFromJson<String, List<ContactLine>>(
          json['contacts'], const ContactsConverter().fromJson),
      description: json['description'] as String,
      name: json['name'] as String,
      time: const TimeOfDayConverter().fromJson(json['time'] as String),
    );

Map<String, dynamic> _$StayLineModelToJson(StayLineModel instance) =>
    <String, dynamic>{
      'time': const TimeOfDayConverter().toJson(instance.time),
      'name': instance.name,
      'description': instance.description,
      'contacts': const ContactsConverter().toJson(instance.contacts),
      'type': const StayTypeConverter().toJson(instance.type),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
