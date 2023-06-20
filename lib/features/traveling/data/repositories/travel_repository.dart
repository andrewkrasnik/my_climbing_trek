import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
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
  Future<Either<Failure, List<Travel>>> getTravels() async {
    return await _travelLocalDatasource.getTravels();
  }
}