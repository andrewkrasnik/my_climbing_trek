import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';

abstract class RemoteGymDataSource {
  Future<Either<Failure, List<ClimbingHall>>> gyms();

  Future<Either<Failure, List<ClimbingHallRoute>>> gymRoutes({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  });
}
