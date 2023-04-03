import 'package:my_climbing_trek/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/remote_gym_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/city.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClimbingHallRepository)
class ClimbingHallRepositoryImpl implements ClimbingHallRepository {
  final ClimbingHallDataSource _climbingHallDataSource;
  final RemoteGymDataSource _remoteGymDataSource;

  ClimbingHallRepositoryImpl(
      this._climbingHallDataSource, this._remoteGymDataSource);
  @override
  Future<Either<Failure, List<City>>> cities() async {
    return await _climbingHallDataSource.cities();
  }

  @override
  Future<Either<Failure, List<ClimbingHall>>> climbingHalls() async {
    // return await _climbingHallDataSource.climbingHalls();
    return await _remoteGymDataSource.gyms();
  }

  @override
  Future<Either<Failure, List<ClimbingHallRoute>>> climbingHallRoutes({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  }) async {
    // return await _climbingHallDataSource.climbingHallRoutes(
    //   climbingHall: climbingHall,
    //   filter: filter,
    // );
    return await _remoteGymDataSource.gymRoutes(
      gym: climbingHall,
      filter: filter,
    );
  }

  @override
  Future<Either<Failure, ClimbingHallRoute>> addRoute(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route}) async {
    // return await _climbingHallDataSource.addRoute(
    //     climbingHall: climbingHall, route: route);
    final failureOrUnit =
        await _remoteGymDataSource.updateRoute(gym: climbingHall, route: route);

    return failureOrUnit.fold((failure) => Left(failure), (_) => Right(route));
  }

  @override
  Future<Either<Failure, Unit>> updateRoute(
      {required ClimbingHall climbingHall, required ClimbingHallRoute route}) {
    // return _climbingHallDataSource.updateRoute(
    //     climbingHall: climbingHall, route: route);

    return _remoteGymDataSource.updateRoute(gym: climbingHall, route: route);
  }

  @override
  Future<Either<Failure, Unit>> updateData() async {
    return _climbingHallDataSource.updateData();
  }
}
