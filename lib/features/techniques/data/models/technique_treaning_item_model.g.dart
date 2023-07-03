// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique_treaning_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechniqueTreaningItemModel _$TechniqueTreaningItemModelFromJson(
        Map<String, dynamic> json) =>
    TechniqueTreaningItemModel(
      group: const TechniqueGroupStringConverter()
          .fromJson(json['group'] as String),
      technique: const TechniqueStringConverter()
          .fromJson(json['technique'] as String),
      treaningId: json['treaningId'] as String,
      comment: json['comment'] as String? ?? '',
      id: json['id'] as String? ?? '',
      options: _$JsonConverterFromJson<String, List<TechniqueOption>>(
          json['options'], const TechniqueOptionsStringConverter().fromJson),
      startTime: _$JsonConverterFromJson<int, DateTime>(
          json['startTime'], const EpochDateTimeConverter().fromJson),
      finishTime: _$JsonConverterFromJson<int, DateTime>(
          json['finishTime'], const EpochDateTimeConverter().fromJson),
      techniqueId: json['techniqueId'] as String,
      groupId: json['groupId'] as String,
    );

Map<String, dynamic> _$TechniqueTreaningItemModelToJson(
        TechniqueTreaningItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': const TechniqueGroupStringConverter().toJson(instance.group),
      'technique': const TechniqueStringConverter().toJson(instance.technique),
      'treaningId': instance.treaningId,
      'comment': instance.comment,
      'options':
          const TechniqueOptionsStringConverter().toJson(instance.options),
      'startTime': _$JsonConverterToJson<int, DateTime>(
          instance.startTime, const EpochDateTimeConverter().toJson),
      'finishTime': _$JsonConverterToJson<int, DateTime>(
          instance.finishTime, const EpochDateTimeConverter().toJson),
      'techniqueId': instance.techniqueId,
      'groupId': instance.groupId,
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
