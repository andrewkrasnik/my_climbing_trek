import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_statistic.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

@LazySingleton()
class GetFeedingStatisticUsecase {
  GetFeedingStatisticUsecase();

  Future<Either<Failure, FeedingStatistic>> call(
      {required List<TravelDay> lines}) async {
    final Map<Meal, Map<FeedingType, int>> statistic = {};

    for (final line in lines) {
      for (var feedingLine in line.feedingsLines) {
        final mealMap = statistic[feedingLine.meal];

        if (mealMap == null) {
          statistic[feedingLine.meal] = {feedingLine.type: 1};
        } else {
          if (mealMap.containsKey(feedingLine.type)) {
            mealMap[feedingLine.type] = mealMap[feedingLine.type]! + 1;
          } else {
            mealMap[feedingLine.type] = 1;
          }

          statistic[feedingLine.meal] = mealMap;
        }
      }
    }
    return Right(FeedingStatistic(statistic: statistic));
  }
}
