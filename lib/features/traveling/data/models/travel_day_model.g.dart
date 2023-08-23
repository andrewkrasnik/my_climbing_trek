// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelDayModel _$TravelDayModelFromJson(Map<String, dynamic> json) =>
    TravelDayModel(
      travelId: json['travelId'] as String,
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      number: json['number'] as int,
      description: json['description'] as String? ?? '',
      feedingsLines: _$JsonConverterFromJson<String, List<FeedingLine>>(
          json['feedingsLines'], const FeedingsLinesConverter().fromJson),
      id: json['id'] as String? ?? '',
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      stayLines: _$JsonConverterFromJson<String, List<StayLine>>(
          json['stayLines'], const StayLinesConverter().fromJson),
      transportLines: _$JsonConverterFromJson<String, List<TransportLine>>(
          json['transportLines'], const TransportLinesConverter().fromJson),
    );

Map<String, dynamic> _$TravelDayModelToJson(TravelDayModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'number': instance.number,
      'description': instance.description,
      'transportLines':
          const TransportLinesConverter().toJson(instance.transportLines),
      'feedingsLines':
          const FeedingsLinesConverter().toJson(instance.feedingsLines),
      'stayLines': const StayLinesConverter().toJson(instance.stayLines),
      'travelId': instance.travelId,
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
