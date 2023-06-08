import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_poin_feature.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point_type.dart';

class TrekPoint extends DataWithUUID {
  final String name;
  final MapPoint? mapPoint;
  final int altitude;
  final TrekPointType type;
  final List<TrekPointFeature> features;
  final String description;
  final String? image;

  TrekPoint({
    required this.name,
    required this.type,
    this.mapPoint,
    this.image,
    this.altitude = 0,
    this.description = '',
    List<TrekPointFeature>? features,
    super.id,
  }) : features = features ?? [];
}
