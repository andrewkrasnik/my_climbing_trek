import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewHallTreaning {
  final HallTreaningRepository treaningRepository;
  NewHallTreaning({
    required this.treaningRepository,
  });

  Future<Either<Failure, ClimbingHallTreaning>> call(
      {required ClimbingHall climbingHall}) async {
    final newTreaning = ClimbingHallTreaning(
        date: DateTime.now(), climbingHall: climbingHall, attempts: []);

    return await treaningRepository.saveTreaning(treaning: newTreaning);
  }
}
