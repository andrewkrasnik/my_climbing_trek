import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';

@LazySingleton()
class CurrentHallTreaning {
  final HallTreaningRepository treaningRepository;

  CurrentHallTreaning(this.treaningRepository);

  Future<Either<Failure, ClimbingHallTreaning>> call() async {
    final failureOrTreaning = await treaningRepository.currentTreaning();
    return failureOrTreaning;
  }
}
