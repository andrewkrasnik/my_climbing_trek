import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_finish.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_start.dart';

class Travel extends Treaning {
  final List<Region> regions;
  final String name;
  final String description;

  TravelStart get travelStart =>
      TravelStart(date: start!.toDayStart(), start: start!);

  TravelFinish get travelFinish => TravelFinish(
        date: finish!.toDayEnd().toDayEnd(),
        start: finish!,
        travel: this,
      );

  List<TravelDay> get travelDays => List.generate(
      finish!.difference(start!).inDays + 1,
      (index) => TravelDay(
            date: start!
                .add(Duration(days: index))
                .toDayEnd()
                .subtract(const Duration(seconds: 1)),
            number: ++index,
          ));

  @override
  final String image;
  Travel({
    required super.date,
    required super.start,
    super.finish,
    required this.regions,
    required this.name,
    required this.image,
    this.description = '',
    super.id,
  });

  String get period => 'c 1 по 12 мая 2023';
}
