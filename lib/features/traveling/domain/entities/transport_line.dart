import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';

class TransportLine {
  final TransportType type;
  final DateTime start;
  final DateTime? finish;
  final String description;
  final List<ContactLine> contacts;

  TransportLine({
    required this.type,
    required this.start,
    this.finish,
    required this.description,
    List<ContactLine>? contacts,
  }) : contacts = contacts ?? [];
}
