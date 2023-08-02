import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';

class TravelDay extends Treaning {
  final int number;
  String description;
  List<TransportLine> transportLines;
  List<FeedingLine> feedingsLines;
  List<StayLine> stayLines;
  final String travelId;

  TravelDay({
    required this.travelId,
    required super.date,
    required this.number,
    this.description = '',
    super.id,
    super.start,
    List<TransportLine>? transportLines,
    List<FeedingLine>? feedingsLines,
    List<StayLine>? stayLines,
  })  : transportLines = transportLines ?? [],
        feedingsLines = feedingsLines ??
            [
              FeedingLine(meal: Meal.breakfast, type: FeedingType.none),
              FeedingLine(meal: Meal.lunch, type: FeedingType.none),
              FeedingLine(meal: Meal.dinner, type: FeedingType.none),
            ],
        stayLines = stayLines ?? [];
}
