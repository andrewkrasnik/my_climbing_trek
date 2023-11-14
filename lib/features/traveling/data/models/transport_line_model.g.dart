// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportLineModel _$TransportLineModelFromJson(Map<String, dynamic> json) =>
    TransportLineModel(
      type: const TransportTypeConverter().fromJson(json['type'] as String),
      contacts: _$JsonConverterFromJson<String, List<ContactLine>>(
          json['contacts'], const ContactsConverter().fromJson),
      description: json['description'] as String,
      finishTime: _$JsonConverterFromJson<String, TimeOfDay>(
          json['finishTime'], const TimeOfDayConverter().fromJson),
      name: json['name'] as String,
      time: const TimeOfDayConverter().fromJson(json['time'] as String),
    );

Map<String, dynamic> _$TransportLineModelToJson(TransportLineModel instance) =>
    <String, dynamic>{
      'time': const TimeOfDayConverter().toJson(instance.time),
      'name': instance.name,
      'description': instance.description,
      'contacts': const ContactsConverter().toJson(instance.contacts),
      'type': const TransportTypeConverter().toJson(instance.type),
      'finishTime': _$JsonConverterToJson<String, TimeOfDay>(
          instance.finishTime, const TimeOfDayConverter().toJson),
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
