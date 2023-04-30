import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:flutter/material.dart';

class HallRouteWidget extends StatelessWidget {
  final ClimbingHallRoute route;
  final ClimbingHall climbingHall;
  final GymRouteAttemptsStatistic? statistic;
  final bool loadStatistic;
  final Widget? child;
  const HallRouteWidget({
    Key? key,
    required this.route,
    required this.climbingHall,
    this.statistic,
    required this.loadStatistic,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String routeSubtitle;

    if (route.autoBelay) {
      routeSubtitle = 'autobelay';
    } else {
      routeSubtitle = route.type.name;
    }

    final String routeTitle;

    if (statistic == null) {
      routeTitle = 'Нет попыток';
    } else {
      if (statistic!.done) {
        routeTitle =
            '${statistic!.ascentType ?? 'Первый пролаз'} ${statistic!.doneDate!.dayString()} '
            '(${statistic!.count})';
      } else {
        routeTitle = 'Проект, попыток: ${statistic!.count}';
      }
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
        subtitle: Text(routeSubtitle),
        trailing: loadStatistic ? const CircularProgressIndicator() : child,
      ),
    );
  }
}
