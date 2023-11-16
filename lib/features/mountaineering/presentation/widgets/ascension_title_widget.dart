import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_category_widget.dart';

class AscensionTitleWidget extends StatelessWidget {
  final Ascension ascension;
  const AscensionTitleWidget({required this.ascension, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(offset: Offset.fromDirection(1))]);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MountainRouteCategoryWidget(route: ascension.route),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ascension.finish?.dayString() ??
                  ascension.start?.dayString() ??
                  ascension.dateString,
              style: textStyle,
            ),
            Text(
              '${ascension.mountain.name}, ${ascension.mountain.altitude} м.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(offset: Offset.fromDirection(1))]),
            ),
            Flexible(
              child: Text(
                '${ascension.route.name}, ${ascension.route.type.name}',
                style: textStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
