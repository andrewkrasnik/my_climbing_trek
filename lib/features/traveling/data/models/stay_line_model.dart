import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';

part 'stay_line_model.g.dart';

@JsonSerializable(converters: [
  StayTypeConverter(),
  TimeOfDayConverter(),
  ContactsConverter(),
])
class StayLineModel extends StayLine {
  StayLineModel({
    required super.type,
    super.contacts,
    required super.description,
    required super.name,
    required super.time,
  });

  factory StayLineModel.fromJson(Map<String, dynamic> json) =>
      _$StayLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$StayLineModelToJson(this);
}
