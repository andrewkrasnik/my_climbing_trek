import 'package:intl/intl.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_filter.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_finish.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_start.dart';

class Travel extends Treaning {
  final List<Region> regions;
  final String name;
  final String description;
  final List<Currency> currencies;
  final TravelStatus status;
  final Currency budgetCurrency;

  Travel({
    required super.date,
    required super.start,
    super.finish,
    required this.regions,
    required this.name,
    required this.image,
    this.status = TravelStatus.planed,
    this.description = '',
    super.id,
    List<Currency>? currencies,
    Currency? budgetCurrency,
  })  : currencies = currencies ?? [Currency.rub],
        budgetCurrency = budgetCurrency ?? Currency.rub;

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
            travelId: id,
            date: start!
                .add(Duration(days: index))
                .toDayEnd()
                .subtract(const Duration(seconds: 1)),
            number: ++index,
          ));

  @override
  final String image;

  String get period {
    String result = 'не указан';
    if (start != null && finish != null) {
      if (start!.month == finish!.month) {
        return 'с ${start!.day} по ${DateFormat('dd MMMM yyyy').format(finish!)}';
      } else {
        return 'с ${DateFormat('dd.MM').format(start!)} по ${DateFormat('dd.MM.yyyy').format(finish!)}';
      }
    }

    return result;
  }

  List<TravelStatus> get nextStatuses {
    switch (status) {
      case TravelStatus.planed:
        return [TravelStatus.started, TravelStatus.canceled];
      case TravelStatus.started:
        return [TravelStatus.finished];
      default:
        return [];
    }
  }
}

enum TravelStatus { planed, started, finished, canceled }

extension TravelStatusExtension on TravelStatus {
  String get description {
    switch (this) {
      case TravelStatus.planed:
        return 'Запланировано';
      case TravelStatus.started:
        return 'Начато';
      case TravelStatus.finished:
        return 'Завершено';
      case TravelStatus.canceled:
        return 'Отменено';
    }
  }

  String get action {
    switch (this) {
      case TravelStatus.planed:
        return 'Запланировать';
      case TravelStatus.started:
        return 'Начать';
      case TravelStatus.finished:
        return 'Завершить';
      case TravelStatus.canceled:
        return 'Отменить';
    }
  }
}
