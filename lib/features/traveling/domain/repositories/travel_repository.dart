import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

abstract class TravelRepository {
  Future<Either<Failure, Travel?>> currentTravel();

  Future<Either<Failure, Unit>> saveTravel({required Travel travel});

  Future<Either<Failure, Unit>> deleteTravel({required Travel travel});

  Future<Either<Failure, List<Treaning>>> getTreanings();

  Future<Either<Failure, List<Travel>>> getTravels({TravelStatus? status});

  Future<Either<Failure, Unit>> editBudgetLine(
      {required TravelBudgetLine line});

  Future<Either<Failure, Unit>> editCostLine({required CostLine line});

  Future<Either<Failure, Unit>> editInsuranceLine(
      {required InsuranceLine line});

  Future<Either<Failure, Unit>> editTravelDay({required TravelDay line});

  Future<Either<Failure, List<TravelBudgetLine>>> getBudgetLines(
      {required Travel travel});

  Future<Either<Failure, List<CostLine>>> getCostLines(
      {required Travel travel});

  Future<Either<Failure, List<InsuranceLine>>> getInsuranceLines(
      {required Travel travel});

  Future<Either<Failure, List<TravelDay>>> getTravelDays(
      {required Travel travel});

  Future<Either<Failure, Unit>> deleteBudgetLine(
      {required TravelBudgetLine line});

  Future<Either<Failure, Unit>> deleteCostLine({required CostLine line});

  Future<Either<Failure, Unit>> deleteInsuranceLine(
      {required InsuranceLine line});

  Future<Either<Failure, Unit>> deleteTravelDay({required TravelDay line});
}
