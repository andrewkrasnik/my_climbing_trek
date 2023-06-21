import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';

part 'trekking_path_event_model.g.dart';

@JsonSerializable(converters: [
  TrekkingEventTypeConverter(),
  TrekPointStringConverter(),
  EpochDateTimeConverter(),
])
class TrekkingPathEventModel extends TrekkingPathEvent {
  TrekkingPathEventModel({
    required super.pathId,
    required super.type,
    required super.time,
    super.id,
    super.point,
    String pointId = '',
  });

  @JsonKey(name: 'pointId')
  String? get routeId => point?.id;

  factory TrekkingPathEventModel.fromJson(Map<String, dynamic> json) =>
      _$TrekkingPathEventModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrekkingPathEventModelToJson(this);
}
