import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_go_button.dart';
import 'package:flutter/material.dart';

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
          HallRouteCategoryWidget(
            category: route.category,
            color: route.color.materialColor,
          ),
          const SizedBox(
            width: 8,
          ),
          HallRouteGoButton(
            climbingHall: climbingHall,
            route: route,
            callback: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
