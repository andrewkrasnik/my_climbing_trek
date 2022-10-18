import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:dartz/dartz.dart';

abstract class ClimbingHallRepository {
  Future<Either<Failure, List<City>>> getSities();
}
