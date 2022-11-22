import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FinishHallTreaning {
  final HallTreaningRepository treaningRepository;
  FinishHallTreaning({
    required this.treaningRepository,
  });

  Future<Either<Failure, ClimbingHallTreaning>> call({
    required ClimbingHallTreaning treaning,
  }) async {
    treaning.finish();
    return await treaningRepository.saveTreaning(treaning: treaning);
  }
}