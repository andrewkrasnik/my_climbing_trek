import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';

part 'contact_line_model.g.dart';

@JsonSerializable(converters: [
  ContactTypeConverter(),
])
class ContactLineModel extends ContactLine {
  ContactLineModel({
    required super.type,
    required super.data,
    super.description,
    super.id,
  });

  factory ContactLineModel.fromJson(Map<String, dynamic> json) =>
      _$ContactLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactLineModelToJson(this);
}
