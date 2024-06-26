import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteHallTreaning {
  final HallTreaningRepository treaningRepository;
  DeleteHallTreaning({
    required this.treaningRepository,
  });

  Future<Either<Failure, Unit>> call({
    required ClimbingHallTreaning treaning,
  }) async {
    return await treaningRepository.deleteTreaning(treaning: treaning);
  }
}
