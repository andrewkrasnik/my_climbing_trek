import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';

class FeedingStatistic {
  final Map<Meal, Map<FeedingType, int>> statistic;

  FeedingStatistic({required this.statistic});
}
