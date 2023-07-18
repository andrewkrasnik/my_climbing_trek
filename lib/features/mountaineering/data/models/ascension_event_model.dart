import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';

part 'ascension_event_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  AscensionEventTypeConverter(),
])
class AscensionEventModel extends AscensionEvent {
  AscensionEventModel({
    required super.ascensionId,
    required super.type,
    super.time,
    super.planedTime,
    super.id,
  });

  factory AscensionEventModel.fromJson(Map<String, dynamic> json) =>
      _$AscensionEventModelFromJson(json);

  Map<String, dynamic> toJson() => _$AscensionEventModelToJson(this);
}
