import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_category_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_aid_category_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_mixed_category_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_ussr_category_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/mixed_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';

class CategoryWidget<T extends DifficultyCategory> extends StatelessWidget {
  final T category;
  final bool selected;

  const CategoryWidget(
      {required this.category, this.selected = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (category is MountaineeringCategory) {
      return MountaineeringCategoryWidget(
        category: category as MountaineeringCategory,
        selected: selected,
      );
    } else if (category is IceCategory) {
      return IceCategoryWidget(
        category: category as IceCategory,
        planed: !selected,
      );
    } else if (category is MixedCategory) {
      return SettingsMixedCategoryWidget(
        category: category as MixedCategory,
        selected: selected,
      );
    } else if (category is ClimbingCategory) {
      return RockCategoryWidget(
        category: category as ClimbingCategory,
        planed: !selected,
      );
    } else if (category is UssrClimbingCategory) {
      return SettingsUssrCategoryWidget(
        category: category as UssrClimbingCategory,
        selected: selected,
      );
    } else if (category is AidCategory) {
      return SettingsAidCategoryWidget(
        category: category as AidCategory,
        selected: selected,
      );
    } else {
      return Container();
    }
  }
}
