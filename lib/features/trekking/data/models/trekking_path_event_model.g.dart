// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trekking_path_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrekkingPathEventModel _$TrekkingPathEventModelFromJson(
        Map<String, dynamic> json) =>
    TrekkingPathEventModel(
      pathId: json['pathId'] as String,
      type: const TrekkingEventTypeConverter().fromJson(json['type'] as String),
      time: const EpochDateTimeConverter().fromJson(json['time'] as int),
      id: json['id'] as String? ?? '',
      point: _$JsonConverterFromJson<String, TrekPoint>(
          json['point'], const TrekPointStringConverter().fromJson),
    );

Map<String, dynamic> _$TrekkingPathEventModelToJson(
        TrekkingPathEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const TrekkingEventTypeConverter().toJson(instance.type),
      'point': _$JsonConverterToJson<String, TrekPoint>(
          instance.point, const TrekPointStringConverter().toJson),
      'time': const EpochDateTimeConverter().toJson(instance.time),
      'pathId': instance.pathId,
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
