import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton(as: TravelRepository)
class TravelRepositoryImpl implements TravelRepository {
  final TravelLocalDatasource _travelLocalDatasource;

  TravelRepositoryImpl(this._travelLocalDatasource);

  @override
  Future<Either<Failure, Travel?>> currentTravel() async {
    return await _travelLocalDatasource.currentTravel();
  }

  @override
  Future<Either<Failure, Unit>> saveTravel({required Travel travel}) async {
    return await _travelLocalDatasource.saveTravel(travel: travel);
  }

  @override
  Future<Either<Failure, Unit>> deleteTravel({required Travel travel}) async {
    return await _travelLocalDatasource.deleteTravel(travel: travel);
  }

  @override
  Future<Either<Failure, List<Treaning>>> getTreanings() async {
    final failureOrTravels = await _travelLocalDatasource.getTreanings();
    return failureOrTravels.fold((failure) => Left(failure), (travels) {
      final List<Treaning> treanings = [];

      for (var travel in travels) {
        treanings.addAll([
          travel.travelStart,
          travel.travelFinish,
          ...travel.travelDays,
        ]);
      }

      return Right(treanings);
    });
  }

  @override
  Future<Either<Failure, List<Travel>>> getPlanedTravels() async {
    return await _travelLocalDatasource.getPlanedTravels();
  }

  @override
  Future<Either<Failure, List<Travel>>> getTravels(
      {TravelStatus? status}) async {
    return await _travelLocalDatasource.getTravels();
  }

  @override
  Future<Either<Failure, Unit>> editBudgetLine(
      {required TravelBudgetLine line}) async {
    return await _travelLocalDatasource.editBudgetLine(line: line);
  }

  @override
  Future<Either<Failure, Unit>> editCostLine({required CostLine line}) async {
    return await _travelLocalDatasource.editCostLine(line: line);
  }

  @override
  Future<Either<Failure, Unit>> editInsuranceLine(
      {required InsuranceLine line}) async {
    return await _travelLocalDatasource.editInsuranceLine(line: line);
  }

  @override
  Future<Either<Failure, Unit>> editTravelDay({required TravelDay line}) async {
    return await _travelLocalDatasource.editTravelDay(line: line);
  }

  @override
  Future<Either<Failure, List<TravelBudgetLine>>> getBudgetLines(
      {required Travel travel}) async {
    return await _travelLocalDatasource.getBudgetLines(travel: travel);
  }

  @override
  Future<Either<Failure, List<CostLine>>> getCostLines(
      {required Travel travel}) async {
    return await _travelLocalDatasource.getCostLines(travel: travel);
  }

  @override
  Future<Either<Failure, List<InsuranceLine>>> getInsuranceLines(
      {required Travel travel}) async {
    return await _travelLocalDatasource.getInsuranceLines(travel: travel);
  }

  @override
  Future<Either<Failure, List<TravelDay>>> getTravelDays(
      {required Travel travel}) async {
    return await _travelLocalDatasource.getTravelDays(travel: travel);
  }

  @override
  Future<Either<Failure, Unit>> deleteBudgetLine(
      {required TravelBudgetLine line}) async {
    return await _travelLocalDatasource.deleteBudgetLine(line: line);
  }

  @override
  Future<Either<Failure, Unit>> deleteCostLine({required CostLine line}) async {
    return await _travelLocalDatasource.deleteCostLine(line: line);
  }

  @override
  Future<Either<Failure, Unit>> deleteInsuranceLine(
      {required InsuranceLine line}) async {
    return await _travelLocalDatasource.deleteInsuranceLine(line: line);
  }

  @override
  Future<Either<Failure, Unit>> deleteTravelDay(
      {required TravelDay line}) async {
    return await _travelLocalDatasource.deleteTravelDay(line: line);
  }
}
