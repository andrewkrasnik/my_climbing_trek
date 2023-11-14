import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/contact_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/cost_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/feeding_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/insurance_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/stay_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/transport_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/travel_budget_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/travel_day_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/travel_model.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

class TravelDayConverter
    implements JsonConverter<TravelDay, Map<String, dynamic>> {
  const TravelDayConverter();

  @override
  TravelDay fromJson(Map<String, dynamic> json) {
    return TravelDayModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TravelDay object) {
    if (object is TravelDayModel) {
      return object.toJson();
    } else {
      return TravelDayModel(
        travelId: object.travelId,
        date: object.date,
        number: object.number,
        description: object.description,
        feedingsLines: object.feedingsLines,
        id: object.id,
        start: object.start,
        stayLines: object.stayLines,
        transportLines: object.transportLines,
      ).toJson();
    }
  }
}

class InsuranceLineConverter
    implements JsonConverter<InsuranceLine, Map<String, dynamic>> {
  const InsuranceLineConverter();

  @override
  InsuranceLine fromJson(Map<String, dynamic> json) {
    return InsuranceLineModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(InsuranceLine object) {
    if (object is InsuranceLineModel) {
      return object.toJson();
    } else {
      return InsuranceLineModel(
        travelId: object.travelId,
        number: object.number,
        insurer: object.insurer,
        description: object.description,
        contacts: object.contacts,
        id: object.id,
        insurant: object.insurant,
      ).toJson();
    }
  }
}

class TravelConverter implements JsonConverter<Travel, Map<String, dynamic>> {
  const TravelConverter();

  @override
  Travel fromJson(Map<String, dynamic> json) {
    return TravelModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Travel object) {
    if (object is TravelModel) {
      return object.toJson();
    } else {
      return TravelModel(
        date: object.date,
        image: object.image,
        name: object.name,
        regions: object.regions,
        budgetCurrency: object.budgetCurrency,
        currencies: object.currencies,
        description: object.description,
        finish: object.finish,
        id: object.id,
        start: object.start,
        status: object.status,
      ).toJson();
    }
  }
}

class CostLineConverter
    implements JsonConverter<CostLine, Map<String, dynamic>> {
  const CostLineConverter();

  @override
  CostLine fromJson(Map<String, dynamic> json) {
    return CostLineModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CostLine object) {
    if (object is CostLineModel) {
      return object.toJson();
    } else {
      return CostLineModel(
        travelId: object.travelId,
        date: object.date,
        type: object.type,
        currency: object.currency,
        incomeExpense: object.incomeExpense,
        budgetSum: object.budgetSum,
        description: object.description,
        id: object.id,
        sum: object.sum,
      ).toJson();
    }
  }
}

class BudgetLineConverter
    implements JsonConverter<TravelBudgetLine, Map<String, dynamic>> {
  const BudgetLineConverter();

  @override
  TravelBudgetLine fromJson(Map<String, dynamic> json) {
    return TravelBudgetLineModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TravelBudgetLine object) {
    if (object is TravelBudgetLineModel) {
      return object.toJson();
    } else {
      return TravelBudgetLineModel(
        travelId: object.travelId,
        type: object.type,
        amount: object.amount,
        description: object.description,
        id: object.id,
      ).toJson();
    }
  }
}

class CostTypeConverter implements JsonConverter<CostType, String> {
  const CostTypeConverter();
  @override
  CostType fromJson(String json) {
    return CostType.getById(json);
  }

  @override
  String toJson(CostType object) {
    return object.id;
  }
}

class CurrencyConverter implements JsonConverter<Currency, int> {
  const CurrencyConverter();
  @override
  Currency fromJson(int json) {
    return Currency.getById(json);
  }

  @override
  int toJson(Currency object) {
    return object.code;
  }
}

class IncomeExpenseConverter implements JsonConverter<IncomeExpense, String> {
  const IncomeExpenseConverter();
  @override
  IncomeExpense fromJson(String json) {
    if (json == 'income') {
      return IncomeExpense.income;
    } else {
      return IncomeExpense.expense;
    }
  }

  @override
  String toJson(IncomeExpense object) {
    return object.name;
  }
}

class ContactsConverter implements JsonConverter<List<ContactLine>, String> {
  const ContactsConverter();

  @override
  List<ContactLine> fromJson(String json) {
    final list = jsonDecode(json) as List<dynamic>;

    return list.map((item) => ContactLineModel.fromJson(item)).toList();
  }

  @override
  String toJson(List<ContactLine> object) {
    final data = object.map((item) {
      if (item is ContactLineModel) {
        return item.toJson();
      } else {
        return ContactLineModel(
          type: item.type,
          data: item.data,
          description: item.description,
          id: item.id,
        ).toJson();
      }
    }).toList();

    return jsonEncode(data);
  }
}

class FeedingsLinesConverter
    implements JsonConverter<List<FeedingLine>, String> {
  const FeedingsLinesConverter();

  @override
  List<FeedingLine> fromJson(String json) {
    final list = jsonDecode(json) as List<dynamic>;

    return list.map((item) => FeedingLineModel.fromJson(item)).toList();
  }

  @override
  String toJson(List<FeedingLine> object) {
    final data = object.map((item) {
      if (item is FeedingLineModel) {
        return item.toJson();
      } else {
        return FeedingLineModel(
          type: item.type,
          contacts: item.contacts,
          meal: item.meal,
        ).toJson();
      }
    }).toList();

    return jsonEncode(data);
  }
}

class StayLinesConverter implements JsonConverter<List<StayLine>, String> {
  const StayLinesConverter();

  @override
  List<StayLine> fromJson(String json) {
    final list = jsonDecode(json) as List<dynamic>;

    return list.map((item) => StayLineModel.fromJson(item)).toList();
  }

  @override
  String toJson(List<StayLine> object) {
    final data = object.map((item) {
      if (item is StayLineModel) {
        return item.toJson();
      } else {
        return StayLineModel(
          type: item.type,
          description: item.description,
          name: item.name,
          time: item.time,
          contacts: item.contacts,
        ).toJson();
      }
    }).toList();

    return jsonEncode(data);
  }
}

class TransportLinesConverter
    implements JsonConverter<List<TransportLine>, String> {
  const TransportLinesConverter();

  @override
  List<TransportLine> fromJson(String json) {
    final list = jsonDecode(json) as List<dynamic>;

    return list.map((item) => TransportLineModel.fromJson(item)).toList();
  }

  @override
  String toJson(List<TransportLine> object) {
    final data = object.map((item) {
      if (item is TransportLineModel) {
        return item.toJson();
      } else {
        return TransportLineModel(
          type: item.type,
          description: item.description,
          name: item.name,
          time: item.time,
          contacts: item.contacts,
          finishTime: item.finishTime,
        ).toJson();
      }
    }).toList();

    return jsonEncode(data);
  }
}

class RegionsConverter implements JsonConverter<List<Region>, String> {
  const RegionsConverter();

  @override
  List<Region> fromJson(String json) {
    final list = jsonDecode(json) as List<dynamic>;

    return list.map((item) => RegionModel.fromJson(item)).toList();
  }

  @override
  String toJson(List<Region> object) {
    final data = object.map((item) {
      if (item is RegionModel) {
        return item.toJson();
      } else {
        return RegionModel(
          name: item.name,
          image: item.image,
          id: item.id,
        ).toJson();
      }
    }).toList();

    return jsonEncode(data);
  }
}

class CurrenciesConverter implements JsonConverter<List<Currency>, String> {
  const CurrenciesConverter();

  @override
  List<Currency> fromJson(String json) {
    final list = jsonDecode(json) as List<dynamic>;

    return list
        .map((item) => const CurrencyConverter().fromJson(item))
        .toList();
  }

  @override
  String toJson(List<Currency> object) {
    final data =
        object.map((item) => const CurrencyConverter().toJson(item)).toList();

    return jsonEncode(data);
  }
}

class TravelStatusConverter implements JsonConverter<TravelStatus, String> {
  const TravelStatusConverter();
  @override
  TravelStatus fromJson(String json) {
    return TravelStatus.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(TravelStatus object) {
    return object.name;
  }
}

class ContactTypeConverter implements JsonConverter<ContactType, String> {
  const ContactTypeConverter();
  @override
  ContactType fromJson(String json) {
    return ContactType.getById(json);
  }

  @override
  String toJson(ContactType object) {
    return object.id;
  }
}

class TransportTypeConverter implements JsonConverter<TransportType, String> {
  const TransportTypeConverter();
  @override
  TransportType fromJson(String json) {
    return TransportType.getById(json);
  }

  @override
  String toJson(TransportType object) {
    return object.id;
  }
}

class StayTypeConverter implements JsonConverter<StayType, String> {
  const StayTypeConverter();
  @override
  StayType fromJson(String json) {
    return StayType.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(StayType object) {
    return object.name;
  }
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();
  @override
  TimeOfDay fromJson(String json) {
    final data = json.split(':');
    return TimeOfDay(
      hour: int.tryParse(data.first) ?? 0,
      minute: int.tryParse(data.last) ?? 0,
    );
  }

  @override
  String toJson(TimeOfDay object) {
    return '${object.hour}:${object.minute}';
  }
}

class FeedingTypeConverter implements JsonConverter<FeedingType, String> {
  const FeedingTypeConverter();
  @override
  FeedingType fromJson(String json) {
    return FeedingType.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(FeedingType object) {
    return object.name;
  }
}

class MealConverter implements JsonConverter<Meal, String> {
  const MealConverter();
  @override
  Meal fromJson(String json) {
    return Meal.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(Meal object) {
    return object.name;
  }
}
