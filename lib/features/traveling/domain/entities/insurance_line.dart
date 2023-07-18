import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';

class InsuranceLine {
  final String insurer;
  final String number;
  final String insurant;
  final String description;
  final List<ContactLine> contacts;

  InsuranceLine({
    required this.insurer,
    required this.description,
    this.insurant = '',
    this.number = '',
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];
}
