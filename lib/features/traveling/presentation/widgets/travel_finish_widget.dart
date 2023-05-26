import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_finish.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_widget.dart';

class TravelFinishWidget extends StatelessWidget {
  final TravelFinish travelFinish;
  const TravelFinishWidget({required this.travelFinish, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TravelWidget(travel: travelFinish.travel),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
