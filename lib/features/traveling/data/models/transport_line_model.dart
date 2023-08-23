import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';

part 'transport_line_model.g.dart';

@JsonSerializable(converters: [
  TransportTypeConverter(),
  TimeOfDayConverter(),
  ContactsConverter(),
])
class TransportLineModel extends TransportLine {
  TransportLineModel({
    required super.type,
    super.contacts,
    required super.description,
    super.finishTime,
    required super.name,
    required super.time,
  });

  factory TransportLineModel.fromJson(Map<String, dynamic> json) =>
      _$TransportLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportLineModelToJson(this);
}
