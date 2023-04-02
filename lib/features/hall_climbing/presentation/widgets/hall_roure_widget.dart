import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/hall_route_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_go_button.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_sector_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallRouteWidget extends StatelessWidget {
  final ClimbingHallRoute route;
  final ClimbingHall climbingHall;
  const HallRouteWidget({
    Key? key,
    required this.route,
    required this.climbingHall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String routeTitle;
    if (route.autoBelay) {
      routeTitle = '${route.type.name} autobelay';
    } else {
      routeTitle = route.type.name;
    }
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Row(
        children: [
          Text(routeTitle),
          const SizedBox(
            width: 16,
          ),
          HallSectorNumberWidget(
            route: route,
            child: HallRouteCategoryWidget(
              category: route.category,
              color: route.color.materialColor,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          HallRouteGoButton(
            climbingHall: climbingHall,
            route: route,
            callback: () => Navigator.of(context).pop(),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HallRoutePage(
                          climbingHall: climbingHall,
                          route: route,
                        )));
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}
