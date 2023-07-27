import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';

class InsuranceLine extends DataWithUUID {
  final String insurer;
  final String number;
  final String insurant;
  final String description;
  final List<ContactLine> contacts;
  final String travelId;

  InsuranceLine({
    required this.travelId,
    required this.insurer,
    required this.description,
    super.id,
    this.insurant = '',
    this.number = '',
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];
}
