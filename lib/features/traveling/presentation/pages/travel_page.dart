import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_widget.dart';

class TravelPage extends StatelessWidget {
  final Travel travel;

  const TravelPage({
    required this.travel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'travel${travel.id}',
                  child: MyCachedNetworkImage(
                      imageUrl: travel.image, fit: BoxFit.cover),
                ),
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      travel.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ...travel.travelDays.map(
                  (day) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          showMyModalBottomSheet<void>(
                            context: context,
                            heightPersent: 0.6,
                            child: TravelDayParametersWidget(day: day),
                          );
                        },
                        child: TravelDayWidget(travelDay: day)),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
