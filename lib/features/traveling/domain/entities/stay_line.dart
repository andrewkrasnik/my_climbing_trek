import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';

class StayLine {
  final String address;
  final String description;
  final DateTime? date;
  final List<ContactLine> contacts;
  StayLine({
    required this.address,
    required this.description,
    this.date,
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];
}
