// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique_treaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechniqueTreaningModel _$TechniqueTreaningModelFromJson(
        Map<String, dynamic> json) =>
    TechniqueTreaningModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => const TechniqueTreaningItemConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$TechniqueTreaningModelToJson(
        TechniqueTreaningModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'comment': instance.comment,
      'items': instance.items
          .map(const TechniqueTreaningItemConverter().toJson)
          .toList(),
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
