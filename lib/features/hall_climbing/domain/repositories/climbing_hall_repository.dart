import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:dartz/dartz.dart';

abstract class ClimbingHallRepository {
  Future<Either<Failure, List<City>>> sities();
  Future<Either<Failure, List<ClimbingHall>>> climbingHalls();
  Future<Either<Failure, List<ClimbingHallRoute>>> climbingHallRoutes(
      {required ClimbingHall climbingHall});
}
