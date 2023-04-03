import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/city.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:dartz/dartz.dart';

abstract class ClimbingHallDataSource {
  Future<Either<Failure, List<City>>> cities();

  Future<Either<Failure, List<ClimbingHall>>> climbingHalls();

  Future<Either<Failure, ClimbingHall>> getHallById(int id);

  Future<Either<Failure, ClimbingHallRoute>> getRouteById(
      {required String id, required int hallId});

  Future<Either<Failure, List<ClimbingHallRoute>>> climbingHallRoutes({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  });

  Future<Either<Failure, ClimbingHallRoute>> addRoute(
      {required ClimbingHall climbingHall, required ClimbingHallRoute route});

  Future<Either<Failure, Unit>> updateRoute(
      {required ClimbingHall climbingHall, required ClimbingHallRoute route});

  Future<Either<Failure, Unit>> updateData();

  Future<Either<Failure, Unit>> saveGyms({required List<ClimbingHall> gyms});

  Future<Either<Failure, Unit>> saveRoutes({
    required ClimbingHall gym,
    required List<ClimbingHallRoute> routes,
  });
}
