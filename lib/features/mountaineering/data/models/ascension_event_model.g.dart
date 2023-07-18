// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ascension_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AscensionEventModel _$AscensionEventModelFromJson(Map<String, dynamic> json) =>
    AscensionEventModel(
      ascensionId: json['ascensionId'] as String,
      type:
          const AscensionEventTypeConverter().fromJson(json['type'] as String),
      time: _$JsonConverterFromJson<int, DateTime>(
          json['time'], const EpochDateTimeConverter().fromJson),
      planedTime: _$JsonConverterFromJson<int, DateTime>(
          json['planedTime'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$AscensionEventModelToJson(
        AscensionEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const AscensionEventTypeConverter().toJson(instance.type),
      'time': _$JsonConverterToJson<int, DateTime>(
          instance.time, const EpochDateTimeConverter().toJson),
      'planedTime': _$JsonConverterToJson<int, DateTime>(
          instance.planedTime, const EpochDateTimeConverter().toJson),
      'ascensionId': instance.ascensionId,
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
