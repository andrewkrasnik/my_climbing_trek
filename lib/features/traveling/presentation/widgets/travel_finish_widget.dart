import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_finish.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_widget.dart';

class TravelFinishWidget extends StatelessWidget {
  final TravelFinish travelFinish;
  const TravelFinishWidget({required this.travelFinish, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Hero(
        tag: 'travel${travelFinish.travel.id}',
        child: TravelWidget(
          travel: travelFinish.travel,
          onTap: () {
            final travel = travelFinish.travel;

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TravelPage(travel: travel)));
          },
        ),
      ),
    );
  }
}
