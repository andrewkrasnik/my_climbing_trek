import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';

class ClimbingRoute {
  final ClimbingCategory category;
  DateTime? firstAttemptDate;
  DateTime? lastAttemptDate;
  List<ClimbingHallAttempt>? attempts;

  ClimbingRoute({required this.category});
}
