import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';

import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';

class TrekkingPathPictureWidget extends StatelessWidget {
  final TrekkingPath path;

  const TrekkingPathPictureWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );

    final events = path.events
      ..sortBy(
        (event) => event.time,
      );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...events.map(
            (event) => Row(
              children: [
                Text(
                  event.time.timeString(),
                  style: textStyle,
                ),
                const SizedBox(width: 4),
                if (event.point != null) ...[
                  Text(
                    event.point!.name,
                    style: textStyle,
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  event.type.name,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
