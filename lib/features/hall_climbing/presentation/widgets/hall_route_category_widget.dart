import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallRouteCategoryWidget extends StatelessWidget {
  final ClimbingCategory category;
  final Color? color;
  final bool planed;

  const HallRouteCategoryWidget({
    Key? key,
    required this.category,
    this.color,
    this.planed = false,
  }) : super(key: key);

  HallRouteCategoryWidget.fromAttempt({
    required ClimbingHallAttempt attempt,
    super.key,
  })  : category = attempt.routeCategory,
        color = attempt.routeColor,
        planed = attempt.planed;

  @override
  Widget build(BuildContext context) {
    final double opacity = planed ? 0.5 : 1;

    if (color == null) {
      return Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(24),
        child: CircleAvatar(
          backgroundColor: Colors.red.withOpacity(opacity),
          radius: 24,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: BlocBuilder<SettingsCubit, SettingsState>(
              buildWhen: (previous, current) =>
                  previous.hallCategoryType != current.hallCategoryType,
              builder: (context, state) {
                final String title = category.title(state.hallCategoryType);
                return Text(
                  title,
                  style: TextStyle(
                      color: Colors.black.withOpacity(opacity),
                      fontWeight: FontWeight.bold,
                      fontSize: category.fontSize(title)),
                );
              },
            ),
          ),
        ),
      );
    } else {
      final Color textColor;
      if (color!.value == Colors.white.value) {
        textColor = Colors.black;
      } else {
        textColor = Colors.white;
      }
      return Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(24),
        child: CircleAvatar(
          backgroundColor: color?.withOpacity(opacity),
          radius: 24,
          child: BlocBuilder<SettingsCubit, SettingsState>(
            buildWhen: (previous, current) =>
                previous.hallCategoryType != current.hallCategoryType,
            builder: (context, state) {
              final String title = category.title(state.hallCategoryType);
              return Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: category.fontSize(title)),
              );
            },
          ),
        ),
      );
    }
  }
}
