import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

@LazySingleton(as: TravelLocalDatasource)
class MockTravelLocalDatasource implements TravelLocalDatasource {
  final List<CostLine> _costs = [];
  final List<TravelBudgetLine> _budgetLines = [];
  final List<InsuranceLine> _insurances = [];
  final List<TravelDay> _days = [];

  final List<Travel> _list = [
    Travel(
      name: 'Ала-Арча 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 5, 1),
      start: DateTime(2023, 5, 1),
      finish: DateTime(2023, 5, 12),
      id: '1',
      currencies: [
        Currency.rub,
        Currency.kgs,
        Currency.usd,
      ],
      regions: [
        Region(
          name: 'Ала-Арча',
          state: 'Киргизия',
          id: 'archa',
          image:
              'https://biomehanika-ekb.ru/wp-content/uploads/2016/02/p0608_06-150x150.jpg',
        ),
      ],
      budget: TravelBudget(
        currency: Currency.rub,
        amount: 100000,
        lines: [
          TravelBudgetLine(
              type: CostType.organization, amount: 35000, travelId: '1'),
          TravelBudgetLine(
              type: CostType.transport, amount: 30000, travelId: '1'),
        ],
      ),
      costs: [
        CostLine(
            date: DateTime.now(),
            type: CostType.transport,
            currency: Currency.rub,
            incomeExpense: IncomeExpense.expense,
            sum: 35000,
            travelId: '1'),
        CostLine(
            date: DateTime.now(),
            type: CostType.transport,
            currency: Currency.rub,
            incomeExpense: IncomeExpense.income,
            sum: 5000,
            travelId: '1'),
      ],
      insurances: [
        InsuranceLine(
          travelId: '1',
          insurer: 'Согласие',
          description: 'на весь период, с эвакуацией',
          insurant: 'Андрей',
          number: 'RG324 N3242',
          contacts: [
            ContactLine(
              type: ContactType.phone,
              data: '+7 495 333 22 11',
              description: 'звонок бесплатный',
            ),
          ],
        )
      ],
    ),
    Travel(
      name: 'Хибины 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 2, 22),
      start: DateTime(2023, 2, 22),
      finish: DateTime(2023, 2, 28),
      regions: [],
    ),
    Travel(
      name: 'Узункол 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 7, 16),
      start: DateTime(2023, 7, 16),
      finish: DateTime(2023, 7, 31),
      regions: [],
    ),
  ];
  @override
  Future<Either<Failure, Travel?>> currentTravel() async {
    return Right(_list.first);
  }

  @override
  Future<Either<Failure, Unit>> deleteTravel({required Travel travel}) async {
    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<Travel>>> getTreanings() async {
    return Right(_list);
  }

  @override
  Future<Either<Failure, Unit>> saveTravel({required Travel travel}) async {
    if (!_list.contains(travel)) {
      _list.add(travel);
    }
    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<Travel>>> getPlanedTravels() async {
    return Right(_list);
  }

  @override
  Future<Either<Failure, List<Travel>>> getTravels() async {
    return Right(_list);
  }

  @override
  Future<Either<Failure, Unit>> editBudgetLine(
      {required TravelBudgetLine line}) async {
    final index = _budgetLines.indexOf(line);
    if (index < 0) {
      _budgetLines.add(line);
    } else {
      _budgetLines[index] = line;
    }
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> editCostLine({required CostLine line}) async {
    final index = _costs.indexOf(line);
    if (index < 0) {
      _costs.add(line);
    } else {
      _costs[index] = line;
    }
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> editInsuranceLine(
      {required InsuranceLine line}) async {
    final index = _insurances.indexOf(line);
    if (index < 0) {
      _insurances.add(line);
    } else {
      _insurances[index] = line;
    }
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> editTravelDay({required TravelDay line}) async {
    final index = _days.indexOf(line);
    if (index < 0) {
      _days.add(line);
    } else {
      _days[index] = line;
    }
    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<TravelBudgetLine>>> getBudgetLines(
      {required Travel travel}) async {
    return Right(_budgetLines
        .where((element) => element.travelId == travel.id)
        .toList());
  }

  @override
  Future<Either<Failure, List<CostLine>>> getCostLines(
      {required Travel travel}) async {
    return Right(
        _costs.where((element) => element.travelId == travel.id).toList());
  }

  @override
  Future<Either<Failure, List<InsuranceLine>>> getInsuranceLines(
      {required Travel travel}) async {
    return Right(
        _insurances.where((element) => element.travelId == travel.id).toList());
  }

  @override
  Future<Either<Failure, List<TravelDay>>> getTravelDays(
      {required Travel travel}) async {
    return Right(
        _days.where((element) => element.travelId == travel.id).toList());
  }

  @override
  Future<Either<Failure, Unit>> deleteBudgetLine(
      {required TravelBudgetLine line}) async {
    _budgetLines.remove(line);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteCostLine({required CostLine line}) async {
    _costs.remove(line);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteInsuranceLine(
      {required InsuranceLine line}) async {
    _insurances.remove(line);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteTravelDay(
      {required TravelDay line}) async {
    _days.remove(line);

    return const Right(unit);
  }
}
