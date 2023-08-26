import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

class TravelDayTitleWidget extends StatelessWidget {
  final TravelDay travelDay;
  const TravelDayTitleWidget({required this.travelDay, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'День ${travelDay.number}: ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 4),
            Text(
              travelDay.dateString,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        if (travelDay.description.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(travelDay.description),
        ],
      ],
    );
  }
}
