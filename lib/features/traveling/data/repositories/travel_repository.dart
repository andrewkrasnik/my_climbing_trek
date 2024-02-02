import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/data/models/converters.dart';
import 'package:my_climbing_trek/features/traveling/data/models/cost_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/insurance_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/travel_budget_line_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/travel_day_model.dart';
import 'package:my_climbing_trek/features/traveling/data/models/travel_model.dart';
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
    final failureOrTravels =
        await _travelLocalDatasource.getTravels(status: TravelStatus.finished);
    return failureOrTravels.fold((failure) => Left(failure), (travels) async {
      final List<Treaning> treanings = [];

      for (var travel in travels) {
        final failureOrDays =
            await _travelLocalDatasource.getTravelDays(travel: travel);

        if (failureOrDays.isLeft()) {
          return Left((failureOrDays as Left).value);
        }

        treanings.addAll([
          travel.travelStart,
          travel.travelFinish,
          ...(failureOrDays as Right<Failure, List<TravelDay>>).value,
        ]);
      }

      return Right(treanings);
    });
  }

  @override
  Future<Either<Failure, List<Travel>>> getTravels(
      {TravelStatus? status}) async {
    return await _travelLocalDatasource.getTravels(status: status);
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

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings() async {
    final failureOrTreanings = await _travelLocalDatasource.getTravels();

    return failureOrTreanings.fold((failure) => Left(failure),
        (treanings) async {
      final List<Map<String, dynamic>> data = [];

      for (var treaning in treanings) {
        final jsonTreaning = (treaning as TravelModel).toJson();

        final failureOrDays =
            await _travelLocalDatasource.getTravelDays(travel: treaning);

        failureOrDays.fold((l) => null, (days) {
          jsonTreaning['travel_days'] =
              days.map((day) => (day as TravelDayModel).toJson()).toList();
        });

        final failureOrCosts =
            await _travelLocalDatasource.getCostLines(travel: treaning);

        failureOrCosts.fold((l) => null, (costs) {
          jsonTreaning['costs'] =
              costs.map((cost) => (cost as CostLineModel).toJson()).toList();
        });

        final failureOrBudget =
            await _travelLocalDatasource.getBudgetLines(travel: treaning);

        failureOrBudget.fold((l) => null, (lines) {
          jsonTreaning['budget_lines'] = lines
              .map((line) => (line as TravelBudgetLineModel).toJson())
              .toList();
        });

        final failureOrInsurances =
            await _travelLocalDatasource.getInsuranceLines(travel: treaning);

        failureOrInsurances.fold((l) => null, (insurances) {
          jsonTreaning['insurances'] = insurances
              .map((insurance) => (insurance as InsuranceLineModel).toJson())
              .toList();
        });

        data.add(jsonTreaning);
      }

      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json) async {
    try {
      for (var jsonTreaning in json) {
        final treaning = TravelModel.fromJson(jsonTreaning);

        await _travelLocalDatasource.saveTravel(travel: treaning);

        if (jsonTreaning['costs'] != null) {
          for (final jsonLine in jsonTreaning['costs']) {
            final line = CostLineModel.fromJson(jsonLine);

            await _travelLocalDatasource.editCostLine(line: line);
          }
        }

        if (jsonTreaning['travel_days'] != null) {
          for (final jsonLine in jsonTreaning['travel_days']) {
            final line = TravelDayModel.fromJson(jsonLine);

            await _travelLocalDatasource.editTravelDay(line: line);
          }
        }

        if (jsonTreaning['budget_lines'] != null) {
          for (final jsonLine in jsonTreaning['budget_lines']) {
            final line = const BudgetLineConverter().fromJson(jsonLine);

            await _travelLocalDatasource.editBudgetLine(line: line);
          }
        }

        if (jsonTreaning['insurances'] != null) {
          for (final jsonLine in jsonTreaning['insurances']) {
            final line = InsuranceLineModel.fromJson(jsonLine);

            await _travelLocalDatasource.editInsuranceLine(line: line);
          }
        }
      }
    } catch (error) {
      return Left(DataConvertionFailure(description: error.toString()));
    }

    return const Right(unit);
  }
}
