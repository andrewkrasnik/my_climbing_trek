import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';

part 'feeding_line_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  FeedingTypeConverter(),
  MealConverter(),
  ContactsConverter(),
])
class FeedingLineModel extends FeedingLine {
  FeedingLineModel({
    super.contacts,
    required super.meal,
    required super.type,
  });

  factory FeedingLineModel.fromJson(Map<String, dynamic> json) =>
      _$FeedingLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedingLineModelToJson(this);
}
