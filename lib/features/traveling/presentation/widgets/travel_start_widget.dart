import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_start.dart';

class TravelStartWidget extends StatelessWidget {
  final TravelStart travelStart;
  const TravelStartWidget({required this.travelStart, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 8),
          Center(child: Text('Начало путешествия')),
        ],
      ),
    );
  }
}
