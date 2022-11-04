import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/hall_treaning_repository.dart';
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
  }) async {
    final ClimbingHallAttempt newAttempt =
        ClimbingHallAttempt(category: category, style: style, route: route);

    return await treaningRepository.saveAttempt(
      treaning: treaning,
      attempt: newAttempt,
    );
  }
}
