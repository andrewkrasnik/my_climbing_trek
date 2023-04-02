import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';

class HallTreaningModel extends ClimbingHallTreaning {
  HallTreaningModel({
    required super.date,
    required super.climbingHall,
    required super.attempts,
    super.id,
    super.finish,
  });
}
