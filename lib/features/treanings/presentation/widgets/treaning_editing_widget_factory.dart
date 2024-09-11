import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_parameters_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_editing_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_treaning_editing_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_editing_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_treaning_editing_widget.dart';
import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_editing_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_treaning_edit_widget.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_path_widget.dart';

class TreaningEditingWidgetFactory extends StatelessWidget {
  final Treaning treaning;
  const TreaningEditingWidgetFactory({required this.treaning, super.key});

  @override
  Widget build(BuildContext context) {
    if (treaning is ClimbingHallTreaning) {
      return HallTreaningEditingWidget(
        treaning: treaning as ClimbingHallTreaning,
      );
    } else if (treaning is IceTreaning) {
      return IceTreaningEditingWidget(
        treaning: treaning as IceTreaning,
      );
    } else if (treaning is CardioTreaning) {
      return CardioParametersWidget(treaning: treaning as CardioTreaning);
    } else if (treaning is StrengthTreaning) {
      return StrengthEditingWidget(
        treaning: treaning as StrengthTreaning,
      );
    } else if (treaning is RockTreaning) {
      return RockTreaningEditingWidget(
        treaning: treaning as RockTreaning,
      );
    } else if (treaning is TrekkingPath) {
      return TrekkingPathWidget(path: treaning as TrekkingPath);
    } else if (treaning is TechniqueTreaning) {
      return TechniqueTreaningEditWidget(
        treaning: treaning as TechniqueTreaning,
      );
    } else if (treaning is Ascension) {
      return AscensionEditingWidget(ascension: treaning as Ascension);
    } else {
      return Container();
    }
  }
}
