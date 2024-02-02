import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';

class MountaineeringCategoryWidget extends StatelessWidget {
  final MountaineeringCategory category;

  const MountaineeringCategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.hallCategoryType != current.hallCategoryType,
      builder: (context, state) {
        final title = category.russianName;
        double fontSize = 24;
        if (title.length > 4) {
          fontSize = 14;
        } else if (title.length > 3) {
          fontSize = 16;
        } else if (title.length > 2) {
          fontSize = 20;
        }
        return CircleAvatar(
          backgroundColor: Colors.green,
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
