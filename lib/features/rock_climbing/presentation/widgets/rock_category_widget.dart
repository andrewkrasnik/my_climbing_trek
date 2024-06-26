import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';

class RockCategoryWidget extends StatelessWidget {
  final DifficultyCategory category;
  final bool planed;

  const RockCategoryWidget({
    super.key,
    required this.category,
    this.planed = false,
  });

  @override
  Widget build(BuildContext context) {
    final double opacity = planed ? 0.5 : 1;

    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.hallCategoryType != current.hallCategoryType,
      builder: (context, state) {
        final title = category.title(state.hallCategoryType);
        double fontSize = 24;
        if (title.length > 4) {
          fontSize = 14;
        } else if (title.length > 3) {
          fontSize = 16;
        } else if (title.length > 2) {
          fontSize = 20;
        }
        return CircleAvatar(
          backgroundColor: category.color.withOpacity(opacity),
          radius: 24,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        );
      },
    );
  }
}
