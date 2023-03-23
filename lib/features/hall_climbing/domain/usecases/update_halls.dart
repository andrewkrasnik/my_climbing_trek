import 'package:climbing_diary/core/failures/failure.dart';

import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateHalls {
  final ClimbingHallRepository climbingHallRepository;

  UpdateHalls(this.climbingHallRepository);

  Future<Either<Failure, Unit>> call() async =>
      climbingHallRepository.updateData();
}
