import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';

@LazySingleton()
class LastHallTreaning {
  final HallTreaningRepository treaningRepository;

  LastHallTreaning(this.treaningRepository);

  Future<Either<Failure, ClimbingHallTreaning>> call() async {
    final failureOrTreaning = await treaningRepository.lastTreaning();
    return failureOrTreaning;
  }
}
