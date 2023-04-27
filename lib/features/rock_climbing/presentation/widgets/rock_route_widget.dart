import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';

class RockRouteWidget extends StatelessWidget {
  final RockRoute route;
  final RockRouteAttemptsStatistic? statistic;
  final void Function(RockRoute route)? onTapGo;
  const RockRouteWidget(
      {required this.route, this.onTapGo, this.statistic, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          leading: Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              RockCategoryWidget(category: route.category),
              if (route.number != null)
                Positioned(
                  bottom: 3,
                  child: Text(
                    route.number.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
            ],
          ),
          title: Text(route.name),
          subtitle: Text('${route.type.name} ${route.description}'
              '\n${statistic?.routeTitle ?? ''}'),
          trailing: onTapGo == null
              ? null
              : ElevatedButton(
                  onPressed: () => onTapGo!(route), child: const Text('GO!')),
        ));
  }
}
