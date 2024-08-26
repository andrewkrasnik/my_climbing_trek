import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';

class TravelFinish extends Treaning {
  @override
  bool get hasDeleting => false;

  final Travel travel;
  TravelFinish({
    required super.date,
    super.id,
    super.start,
    required this.travel,
  });
}
