import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_filter.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_finish.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_start.dart';

class Travel extends Treaning {
  final List<Region> regions;
  final String name;
  final String description;
  final TravelBudget? budget;
  final List<CostLine> costs;
  final List<InsuranceLine> insurances;
  final List<Currency> currencies;

  Travel({
    required super.date,
    required super.start,
    super.finish,
    required this.regions,
    required this.name,
    required this.image,
    this.description = '',
    super.id,
    this.budget,
    List<CostLine>? costs,
    List<InsuranceLine>? insurances,
    List<Currency>? currencies,
  })  : insurances = insurances ?? [],
        costs = costs ?? [],
        currencies = [Currency.rub];

  TravelFilter get filter {
    Region? region;

    if (regions.length == 1) {
      region = regions.first;
    }

    return TravelFilter(region: region);
  }

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

  String get period => 'c 1 по 12 мая 2023';
}
