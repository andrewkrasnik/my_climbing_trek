import 'package:climbing_diary/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClimbingHallRepository)
class ClimbingHallRepositoryImpl implements ClimbingHallRepository {
  final ClimbingHallDataSource climbingHallDataSource;

  ClimbingHallRepositoryImpl({required this.climbingHallDataSource});
  @override
  Future<Either<Failure, List<City>>> cities() async {
    return await climbingHallDataSource.cities();
  }

  @override
  Future<Either<Failure, List<ClimbingHall>>> climbingHalls() async {
    return await climbingHallDataSource.climbingHalls();
  }

  @override
  Future<Either<Failure, List<ClimbingHallRoute>>> climbingHallRoutes({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  }) async {
    return await climbingHallDataSource.climbingHallRoutes(
      climbingHall: climbingHall,
      filter: filter,
    );
  }

  @override
  Future<Either<Failure, ClimbingHallRoute>> addRoute(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route}) async {
    return await climbingHallDataSource.addRoute(
        climbingHall: climbingHall, route: route);
  }
}
