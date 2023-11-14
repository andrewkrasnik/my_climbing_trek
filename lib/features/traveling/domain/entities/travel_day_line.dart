import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';

class TravelDayLine {
  final TimeOfDay time;
  final String name;
  final String description;
  final List<ContactLine> contacts;

  TravelDayLine({
    required this.name,
    required this.description,
    required this.time,
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];

  IconData? get icon => null;
}
