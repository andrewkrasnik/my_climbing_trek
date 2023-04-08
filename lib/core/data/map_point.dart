import 'package:equatable/equatable.dart';

class MapPoint extends Equatable {
  final double latitude;
  final double longitude;

  const MapPoint({
    required this.latitude,
    required this.longitude,
  });

  factory MapPoint.empty() => const MapPoint(latitude: 0, longitude: 0);

  @override
  List<Object?> get props => [latitude, longitude];

  String get coordinates => '$longitude,$latitude';
}
