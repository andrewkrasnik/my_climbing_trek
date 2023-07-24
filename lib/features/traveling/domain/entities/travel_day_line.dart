import 'package:flutter/src/widgets/icon_data.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';

class TravelDayLine {
  final DateTime date;
  final String name;
  final String description;
  final List<ContactLine> contacts;

  TravelDayLine({
    required this.name,
    required this.description,
    required this.date,
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];

  IconData? get icon => null;
}
