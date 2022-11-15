import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetClimbingHallRoures {
  final ClimbingHallRepository climbingHallRepository;

  GetClimbingHallRoures(this.climbingHallRepository);

  Future<Either<Failure, List<ClimbingHallRoute>>> call({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  }) async =>
      climbingHallRepository.climbingHallRoutes(
        climbingHall: climbingHall,
        filter: filter,
      );
}
