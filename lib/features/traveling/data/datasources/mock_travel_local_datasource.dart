import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

// @LazySingleton(as: TravelLocalDatasource)
class MockTravelLocalDatasource implements TravelLocalDatasource {
  MockTravelLocalDatasource() {
    _days.addAll(_list.first.travelDays);
  }
  final List<CostLine> _costs = [];
  final List<TravelBudgetLine> _budgetLines = [];
  final List<InsuranceLine> _insurances = [];

  final List<Travel> _list = [
    Travel(
      name: 'Ала-Арча 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 8, 1),
      start: DateTime(2023, 8, 1),
      finish: DateTime(2023, 8, 12),
      id: '1',
      currencies: [
        Currency.rub,
        Currency.kgs,
        Currency.usd,
      ],
      status: TravelStatus.started,
      regions: [
        Region(
          name: 'Ала-Арча',
          state: 'Киргизия',
          id: 'archa',
          image:
              'https://biomehanika-ekb.ru/wp-content/uploads/2016/02/p0608_06-150x150.jpg',
        ),
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

  final List<TravelDay> _days = [];

  @override
  Future<Either<Failure, Travel?>> currentTravel() async {
    return Right(_list
        .firstWhereOrNull((element) => element.status == TravelStatus.started));
  }

  @override
  Future<Either<Failure, Unit>> deleteTravel({required Travel travel}) async {
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveTravel({required Travel travel}) async {
    final index = _list.indexWhere((element) => element.id == travel.id);
    if (index < 0) {
      _list.add(travel);
    } else {
      _list[index] = travel;
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<Travel>>> getTravels(
      {TravelStatus? status}) async {
    if (status == null) {
      return Right(_list);
    } else {
      return Right(_list.where((element) => element.status == status).toList());
    }
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
    final index = _days.indexWhere((element) => element.id == line.id);
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
