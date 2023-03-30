import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';

class HallTreaningModel extends ClimbingHallTreaning {
  HallTreaningModel({
    required super.date,
    required super.climbingHall,
    required super.attempts,
    super.id,
    super.finish,
  });
}
