import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/db_tables.dart';
import 'package:my_climbing_trek/core/datasource/local_db_datasource.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

@LazySingleton(as: TravelLocalDatasource)
class DriftTravelLocalDatasource extends TravelLocalDatasource {
  final LocalDBDatasource _localDatabase;

  final table = DBTables.travels;

  final daysTable = DBTables.travelDays;

  final budgetTable = DBTables.travelBudget;

  final costsTable = DBTables.travelCosts;

  final insuranceTable = DBTables.travelInsurance;

  DriftTravelLocalDatasource(this._localDatabase);

  @override
  Future<Either<Failure, Travel?>> currentTravel() async {
    final failureOrData = await _localDatabase.getData(
      table: table,
      whereConditions: {'status': TravelStatus.started.name},
      orderByConditions: {'start': false},
    );

    return failureOrData.fold((failure) => Left(failure), (data) {
      if (data.isEmpty) {
        return const Right(null);
      } else {
        return Right(const TravelConverter().fromJson(data.first));
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteBudgetLine(
      {required TravelBudgetLine line}) async {
    return await _localDatabase.deleteById(
        table: budgetTable, data: const BudgetLineConverter().toJson(line));
  }

  @override
  Future<Either<Failure, Unit>> deleteCostLine({required CostLine line}) async {
    return await _localDatabase.deleteById(
        table: costsTable, data: const CostLineConverter().toJson(line));
  }

  @override
  Future<Either<Failure, Unit>> deleteInsuranceLine(
      {required InsuranceLine line}) async {
    return await _localDatabase.deleteById(
        table: insuranceTable,
        data: const InsuranceLineConverter().toJson(line));
  }

  @override
  Future<Either<Failure, Unit>> deleteTravel({required Travel travel}) async {
    return await _localDatabase.deleteById(
        table: table, data: const TravelConverter().toJson(travel));
  }

  @override
  Future<Either<Failure, Unit>> deleteTravelDay(
      {required TravelDay line}) async {
    return await _localDatabase.deleteById(
        table: daysTable, data: const TravelDayConverter().toJson(line));
  }

  @override
  Future<Either<Failure, Unit>> editBudgetLine(
      {required TravelBudgetLine line}) async {
    final data = const BudgetLineConverter().toJson(line);

    final failureOrUnit =
        await _localDatabase.updateById(table: budgetTable, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, Unit>> editCostLine({required CostLine line}) async {
    final data = const CostLineConverter().toJson(line);

    final failureOrUnit =
        await _localDatabase.updateById(table: costsTable, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, Unit>> editInsuranceLine(
      {required InsuranceLine line}) async {
    final data = const InsuranceLineConverter().toJson(line);

    final failureOrUnit =
        await _localDatabase.updateById(table: insuranceTable, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, Unit>> editTravelDay({required TravelDay line}) async {
    final data = const TravelDayConverter().toJson(line);

    final failureOrUnit =
        await _localDatabase.updateById(table: daysTable, data: data);

    return failureOrUnit;
  }

  @override
  Future<Either<Failure, List<TravelBudgetLine>>> getBudgetLines(
      {required Travel travel}) async {
    final failureOrData = await _localDatabase.getData(
      table: budgetTable,
      whereConditions: {'travel_id': travel.id},
      orderByConditions: {'type': false},
    );

    return failureOrData.fold(
        (failure) => Left(failure),
        (data) => Right(data
            .map((json) => const BudgetLineConverter().fromJson(json))
            .toList()));
  }

  @override
  Future<Either<Failure, List<CostLine>>> getCostLines(
      {required Travel travel}) async {
    final failureOrData = await _localDatabase.getData(
      table: costsTable,
      whereConditions: {'travel_id': travel.id},
      orderByConditions: {'date': false},
    );

    return failureOrData.fold(
        (failure) => Left(failure),
        (data) => Right(data
            .map((json) => const CostLineConverter().fromJson(json))
            .toList()));
  }

  @override
  Future<Either<Failure, List<InsuranceLine>>> getInsuranceLines(
      {required Travel travel}) async {
    final failureOrData = await _localDatabase.getData(
      table: insuranceTable,
      whereConditions: {'travel_id': travel.id},
      orderByConditions: {'insurant': false},
    );

    return failureOrData.fold(
        (failure) => Left(failure),
        (data) => Right(data
            .map((json) => const InsuranceLineConverter().fromJson(json))
            .toList()));
  }

  @override
  Future<Either<Failure, List<TravelDay>>> getTravelDays(
      {required Travel travel}) async {
    final failureOrData = await _localDatabase.getData(
      table: daysTable,
      whereConditions: {'travel_id': travel.id},
      orderByConditions: {'date': false},
    );

    return failureOrData.fold(
        (failure) => Left(failure),
        (data) => Right(data
            .map((json) => const TravelDayConverter().fromJson(json))
            .toList()));
  }

  @override
  Future<Either<Failure, List<Travel>>> getTravels(
      {TravelStatus? status}) async {
    final failureOrData = await _localDatabase.getData(
      table: table,
      whereConditions: status == null ? null : {'status': status.name},
      orderByConditions: {'start': false},
    );

    return failureOrData.fold(
        (failure) => Left(failure),
        (data) => Right(data
            .map((json) => const TravelConverter().fromJson(json))
            .toList()));
  }

  @override
  Future<Either<Failure, Unit>> saveTravel({required Travel travel}) async {
    final data = const TravelConverter().toJson(travel);

    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit;
  }
}
