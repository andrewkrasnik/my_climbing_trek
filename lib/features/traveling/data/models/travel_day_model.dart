import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

part 'travel_day_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  FeedingsLinesConverter(),
  StayLinesConverter(),
  TransportLinesConverter(),
])
class TravelDayModel extends TravelDay {
  TravelDayModel({
    required super.travelId,
    required super.date,
    required super.number,
    super.description,
    super.feedingsLines,
    super.id,
    super.start,
    super.stayLines,
    super.transportLines,
  });

  factory TravelDayModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$TravelDayModelToJson(this);
}
