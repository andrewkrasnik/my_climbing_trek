import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';

class TravelDay extends Treaning {
  final int number;
  String description;
  List<TransportLine> transportLines;

  TravelDay(
      {required super.date,
      required this.number,
      this.description = '',
      super.id,
      super.start,
      List<TransportLine>? transportLines})
      : transportLines = transportLines ?? [];
}
