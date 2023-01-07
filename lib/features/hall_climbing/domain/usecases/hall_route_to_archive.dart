import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class HallRouteToArchive {
  final ClimbingHallRepository repository;

  HallRouteToArchive({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call({
    required ClimbingHall hall,
    required ClimbingHallRoute route,
  }) async {
    route.archive = true;

    return await repository.updateRoute(climbingHall: hall, route: route);
  }
}
