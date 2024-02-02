import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_category_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/multi_pitch_category_widget.dart';

class MountainRouteCategoryWidget extends StatelessWidget {
  final MountainRoute route;
  const MountainRouteCategoryWidget({required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (!route.isMultiPitch)
          MountaineeringCategoryWidget(category: route.category),
        if (route.isMultiPitch)
          MultiPitchCategoryWidget(
            aidCategory: route.aidCategory,
            climbingCategory: route.climbingCategory,
            ussrCategory: route.ussrCategory,
          ),
      ],
    );
  }
}
