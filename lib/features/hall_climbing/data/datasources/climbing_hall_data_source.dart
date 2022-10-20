import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:dartz/dartz.dart';

abstract class ClimbingHallDataSource {
  Future<Either<Failure, List<City>>> getSities();
  Future<Either<Failure, List<ClimbingHall>>> getClimbingHalls();
}
