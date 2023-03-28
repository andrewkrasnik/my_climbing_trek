import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/widgets/cardio_treaning_widget.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_treaning_widget.dart';
import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:flutter/material.dart';

class TreaningPageFactory extends StatelessWidget {
  final Treaning treaning;
  const TreaningPageFactory({required this.treaning, Key? key})
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
    } else {
      return Container();
    }
  }
}
