import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AllClimbingHalls {
  final ClimbingHallRepository climbingHallRepository;

  AllClimbingHalls(this.climbingHallRepository);

  Future<Either<Failure, List<ClimbingHall>>> call() async =>
      climbingHallRepository.getClimbingHalls();
}
