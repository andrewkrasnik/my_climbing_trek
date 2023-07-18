// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ascension_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AscensionModel _$AscensionModelFromJson(Map<String, dynamic> json) =>
    AscensionModel(
      date: const EpochDateTimeConverter().fromJson(json['date'] as int),
      mountain:
          const MountainStringConverter().fromJson(json['mountain'] as String),
      route: const MountainRouteStringConverter()
          .fromJson(json['route'] as String),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => const AscensionEventConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      finish: _$JsonConverterFromJson<int, DateTime>(
          json['finish'], const EpochDateTimeConverter().fromJson),
      start: _$JsonConverterFromJson<int, DateTime>(
          json['start'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String? ?? '',
      mountainId: json['mountainId'] as String,
      routeId: json['routeId'] as String,
    );

Map<String, dynamic> _$AscensionModelToJson(AscensionModel instance) =>
    <String, dynamic>{
      'date': const EpochDateTimeConverter().toJson(instance.date),
      'id': instance.id,
      'start': _$JsonConverterToJson<int, DateTime>(
          instance.start, const EpochDateTimeConverter().toJson),
      'finish': _$JsonConverterToJson<int, DateTime>(
          instance.finish, const EpochDateTimeConverter().toJson),
      'mountain': const MountainStringConverter().toJson(instance.mountain),
      'route': const MountainRouteStringConverter().toJson(instance.route),
      'events':
          instance.events.map(const AscensionEventConverter().toJson).toList(),
      'routeId': instance.routeId,
      'mountainId': instance.mountainId,
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
