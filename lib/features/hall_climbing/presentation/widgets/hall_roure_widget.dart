import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_go_button.dart';
import 'package:flutter/material.dart';

class HallRouteWidget extends StatelessWidget {
  final ClimbingHallRoute route;
  final ClimbingHall climbingHall;
  final GymRouteAttemptsStatistic? statistic;
  final bool loadStatistic;
  const HallRouteWidget({
    Key? key,
    required this.route,
    required this.climbingHall,
    this.statistic,
    required this.loadStatistic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String routeTitle;
    if (route.autoBelay) {
      routeTitle = 'autobelay';
    } else {
      routeTitle = route.type.name;
    }
    return Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          leading: HallRouteCategoryWidget(
            category: route.category,
            color: route.color.materialColor,
            sectorNumber: route.sectorNumber,
          ),
          title: Text(routeTitle),
          subtitle: Text(''),
          trailing: loadStatistic
              ? const CircularProgressIndicator()
              : statistic == null
                  ? const Text("Нет попыток")
                  : _StatisticWidget(statistic: statistic!),
        ));

    // HallRouteGoButton(
    //   climbingHall: climbingHall,
    //   route: route,
    //   callback: () => Navigator.of(context).pop(),
    // ),
  }
}

class _StatisticWidget extends StatelessWidget {
  final GymRouteAttemptsStatistic statistic;
  const _StatisticWidget({required this.statistic, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Text(statistic.count.toString()),
    );
  }
}
