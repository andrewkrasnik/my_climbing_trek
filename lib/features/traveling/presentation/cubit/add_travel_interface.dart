import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';

abstract class AddTravelInterface {
  Future<void> addTravel({
    required String name,
    required String description,
    required String image,
    DateTime? date,
    DateTime? start,
    DateTime? finish,
    Travel? travel,
  });
}
