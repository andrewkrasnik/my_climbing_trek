import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_treaning_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_treaning_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_treaning_widget.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_finish.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_start.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_finish_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_start_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_widget.dart';

class TreaningWidgetFactory extends StatelessWidget {
  final Treaning treaning;
  const TreaningWidgetFactory({required this.treaning, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (treaning is ClimbingHallTreaning) {
      return HallTreaningWidget(treaning: treaning as ClimbingHallTreaning);
    } else if (treaning is IceTreaning) {
      return IceTreaningWidget(treaning: treaning as IceTreaning);
    } else if (treaning is CardioTreaning) {
      return CardioTreaningWidget(treaning: treaning as CardioTreaning);
    } else if (treaning is StrengthTreaning) {
      return StrengthTreaningWidget(treaning: treaning as StrengthTreaning);
    } else if (treaning is RockTreaning) {
      return RockTreaningWidget(treaning: treaning as RockTreaning);
    } else if (treaning is Travel) {
      return TravelWidget(travel: treaning as Travel);
    } else if (treaning is TravelFinish) {
      return TravelFinishWidget(travelFinish: treaning as TravelFinish);
    } else if (treaning is TravelStart) {
      return TravelStartWidget(travelStart: treaning as TravelStart);
    } else if (treaning is TravelDay) {
      return TravelDayWidget(travelDay: treaning as TravelDay);
    } else {
      return Container();
    }
  }
}
