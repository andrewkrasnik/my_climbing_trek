import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:dartz/dartz.dart';

abstract class ClimbingHallRepository {
  Future<Either<Failure, List<ClimbingHall>>> climbingHalls();
  Future<Either<Failure, List<ClimbingHallRoute>>> climbingHallRoutes({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  });
  Future<Either<Failure, ClimbingHallRoute>> addRoute(
      {required ClimbingHall climbingHall, required ClimbingHallRoute route});

  Future<Either<Failure, Unit>> updateRoute(
      {required ClimbingHall climbingHall, required ClimbingHallRoute route});

  Future<Either<Failure, Unit>> updateData();
}
