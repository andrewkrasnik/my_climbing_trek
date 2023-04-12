import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewHallAttempt {
  final HallTreaningRepository treaningRepository;
  NewHallAttempt({
    required this.treaningRepository,
  });

  Future<Either<Failure, ClimbingHallAttempt>> call({
    required ClimbingHallTreaning treaning,
    required ClimbingCategory category,
    required ClimbingStyle style,
    ClimbingHallRoute? route,
    bool start = false,
  }) async {
    final ClimbingHallAttempt newAttempt = ClimbingHallAttempt(
      category: category,
      style: style,
      route: route,
      treaningId: treaning.id,
    );

    if (start) {
      newAttempt.start();
    }

    return await treaningRepository.saveAttempt(
      treaning: treaning,
      attempt: newAttempt,
    );
  }
}
