import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';

class TransportLine {
  final TransportType type;
  final DateTime start;
  final DateTime? finish;
  final String description;

  TransportLine({
    required this.type,
    required this.start,
    this.finish,
    required this.description,
  });
}
