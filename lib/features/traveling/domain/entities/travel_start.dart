import 'package:my_climbing_trek/core/data/treaning.dart';

class TravelStart extends Treaning {
  @override
  bool get hasDeleting => false;

  TravelStart({required super.date, super.id, super.start});
}
