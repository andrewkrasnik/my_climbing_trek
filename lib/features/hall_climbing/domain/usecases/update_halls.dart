import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateHalls {
  final ClimbingHallRepository climbingHallRepository;

  UpdateHalls(this.climbingHallRepository);

  Future<Either<Failure, Unit>> call() async =>
      climbingHallRepository.updateData();
}
