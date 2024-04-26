import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

class TrekSection {
  final TrekPoint start;
  final TrekPoint finish;
  final double length;
  final String description;

  TrekSection({
    required this.start,
    required this.finish,
    required this.length,
    this.description = '',
  });

  int get climbLength => finish.altitude - start.altitude;

  String climb(bool turn) {
    final int climbAltitude;
    if (turn) {
      climbAltitude = start.altitude - finish.altitude;
    } else {
      climbAltitude = finish.altitude - start.altitude;
    }

    if (climbAltitude > 0) {
      return ', набор высоты $climbAltitude м.';
    } else if (climbAltitude < 0) {
      return ', сброс высоты ${-climbAltitude} м.';
    } else {
      return '';
    }
  }
}
