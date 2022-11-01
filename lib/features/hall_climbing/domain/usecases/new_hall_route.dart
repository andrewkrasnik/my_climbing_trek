import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewHallRoute {
  final ClimbingHallRepository climbingHallRepository;
  NewHallRoute({
    required this.climbingHallRepository,
  });

  Future<Either<Failure, ClimbingHallRoute>> call(
      {required ClimbingHallRoute route}) async {
    return await climbingHallRepository.addRoute(route: route);
  }
}
