import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

class TravelDayWidget extends StatelessWidget {
  final TravelDay travelDay;
  const TravelDayWidget({required this.travelDay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('День ${travelDay.number}: '),
        const SizedBox(width: 4),
        Text(travelDay.dateString),
      ],
    );
  }
}
