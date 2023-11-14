import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';

part 'insurance_line_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  ContactsConverter(),
])
class InsuranceLineModel extends InsuranceLine {
  InsuranceLineModel({
    required super.travelId,
    required super.number,
    super.id,
    required super.insurer,
    required super.description,
    super.contacts,
    super.insurant,
  });

  factory InsuranceLineModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceLineModelToJson(this);
}
